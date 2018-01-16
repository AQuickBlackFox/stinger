#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<CL/cl.h>
#include"CLHelper.h"
#include<iostream>

#define KERNEL(src) #src

const static char* kernelSource = KERNEL(
__kernel void sGemm(const int M, const in N, const int K,
                    const __global float *A,
                    const __global float *B,
                    __global float *C) {
    const int row = get_local_id(0);
    const int col = get_local_id(1);
    const int globalRow = TS * get_group_id(0) + row;
    const int globalCol = TS * get_group_id(1) + col;

    __local float sA[TS][TS];
    __local float sB[TS][TS];

    float acc[WPT];
    for(int w = 0; w < WPT; w++) {
        acc[w] = 0.0f;
    }

    const int numTiles = K / TS;

    for(int t=0;t<numTiles;t++) {
        for(int w=0;w<WPT;w++) {
            const int tiledRow = TS * t + row;
            const int tiledCol = TS * t + col;
            sA[col + w*RTS][row] = A[(tiledCol + w*RTS)*M + globalRow];
            sB[col + w*RTS][row] = B[(globalCol + w*RTS)*K + tiledRow];
        }

        barrier(CLK_LOCAL_MEM_FENCE);

        for(int k=0;k<TS;k++) {
            for(int w=0;w<WPT;w++) {
                acc[w] += sA[k][row] * sB[col +w*RTS][k];
            }
        }

        barrier(CLK_LOCAL_MEM_FENCE);
    }

    for(int w = 0; w < WPT; w++) {
        C[(globalCol + w*RTS)*M + globalRow] = acc[w];
    }
}
);

int main(){
    unsigned int n = 512 * 512;

    float *h_a;
    float *h_b;
    float *h_c;

    cl_mem d_a;
    cl_mem d_b;
    cl_mem d_c;

    cl_platform_id cpPlatform;
    cl_device_id device_id;
    cl_context context;
    cl_command_queue queue;
    cl_program program;
    cl_kernel kernel;

    size_t bytes = n*sizeof(float);

    h_a = (float*)malloc(bytes);
    h_b = (float*)malloc(bytes);
    h_c = (float*)malloc(bytes);

    for(int i=0;i<n;i++){
        h_a[i] = 1.0f;
        h_b[i] = 1.0f;
        h_c[i] = 0;
    }

    size_t globalSize, localSize;
    cl_int err;

    localSize = 512;
    globalSize = ceil(n/(float)localSize)*localSize;

    err = clGetPlatformIDs(1, &cpPlatform, NULL);
    CL_CHECK(err);
    err = clGetDeviceIDs(cpPlatform, CL_DEVICE_TYPE_GPU, 1, &device_id, NULL);
    CL_CHECK(err);
    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
    CL_CHECK(err);
    queue = clCreateCommandQueue(context, device_id, 0, &err);
    CL_CHECK(err);
    program = clCreateProgramWithSource(context, 1, (const char**)&kernelSource, NULL, &err);
    CL_CHECK(err);
    clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
    kernel = clCreateKernel(program, "sGemm", &err);
    CL_CHECK(err);
    d_a = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);
    d_b = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);
    d_c = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);

    err = clEnqueueWriteBuffer(queue, d_a, CL_TRUE, 0, bytes, h_a, 0, NULL, NULL);

    err |= clEnqueueWriteBuffer(queue, d_b, CL_TRUE, 0, bytes, h_b, 0, NULL, NULL);
    err |= clEnqueueWriteBuffer(queue, d_c, CL_TRUE, 0, bytes, h_c, 0, NULL, NULL);
    CL_CHECK(err);
    int M, N, K;
    M = 512;
    N = 512;
    K = 512;

    err = clSetKernelArg(kernel, 0, sizeof(int), &M);
    err|= clSetKernelArg(kernel, 1, sizeof(int), &N);
    err|= clSetKernelArg(kernel, 2, sizeof(int), &K);
    err|= clSetKernelArg(kernel, 3, sizeof(cl_mem), &d_a);
    err|= clSetKernelArg(kernel, 4, sizeof(cl_mem), &d_b);
    err|= clSetKernelArg(kernel, 5, sizeof(cl_mem), &d_c);

    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &globalSize, &localSize, 0, NULL, NULL);

    clFinish(queue);

    clEnqueueReadBuffer(queue, d_c, CL_TRUE, 0, bytes, h_c, 0, NULL, NULL);

    float sum = 0;
    for(int i=0;i<n;i++){
        sum += h_c[i];
    }

    printf("final result: %f\n", sum);

    clReleaseMemObject(d_a);
    clReleaseMemObject(d_b);
    clReleaseMemObject(d_c);
    clReleaseProgram(program);
    clReleaseKernel(kernel);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);

    free(h_a);
    free(h_b);
    free(h_c);
}
