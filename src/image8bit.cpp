#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<CL/cl.h>
#include<iostream>

const char *kernelSource = "\n"\
"__kernel void imageAdd(image2d_t input, \n" \
"               image2d_t output)        \n" \
"{                                       \n" \
"   int x = get_global_id(0);           \n" \
"   float4 inp = read_imagef(texture, int2(x, 0)); \n" \
"   write_imagef(output, int2(x, 0), inp); \n" \
"}                              \n" \
"\n";

int main() {
    unsigned n = 64;
    uint32_t  *h_a;
    uint32_t *h_b;

    cl_image_format inputFormat, outputFormat;
    inputFormat.image_channel_order = CL_RGBA;
    inputFormat.image_channel_data_type = CL_UNSIGNED_INT32;
    outputFormat.image_channel_order = CL_RGBA;
    outputFormat.image_channel_data_type = CL_UNSIGNED_INT32;

    cl_mem d_a;
    cl_mem d_b;

    cl_platform_id cpPlatform;
    cl_device_id   device_id;
    cl_context     context;
    cl_command_queue queue;
    cl_program program;
    cl_kernel kernel;

    size_t inputImageBytes = n * sizeof(uint32_t);
    size_t outputImageBytes = n * sizeof(uint32_t);

    h_a = (uint32_t*)malloc(inputImageBytes);
    h_b = (uint32_t*)malloc(outputImageBytes);

    for(int i=0;i<n;i++){
        h_a[i] = (uint32_t)i;
        h_b[i] = (uint32_t)0;
    }

    size_t globalSize, localSize;
    cl_int err;

    localSize = 64;
    globalSize = ceil(n/(float)localSize)*localSize;

    err = clGetPlatformIDs(1, &cpPlatform, NULL);

    err = clGetDeviceIDs(cpPlatform, CL_DEVICE_TYPE_GPU, 1, &device_id, NULL);

    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);

    queue = clCreateCommandQueue(context, device_id, 0, &err);

    program = clCreateProgramWithSource(context, 1, (const char**)&kernelSource, NULL, &err);

    clBuildProgram(program, 0, NULL, NULL, NULL, NULL);

    kernel = clCreateKernel(program, "imageAdd", &err);

    d_a = clCreateImage2D(context, CL_MEM_READ_WRITE, &inputFormat, n, 1, n*sizeof(uint32_t), NULL, NULL);
    d_b = clCreateImage2D(context, CL_MEM_READ_WRITE, &outputFormat, n, 1, n*sizeof(uint32_t), NULL, NULL);

    err = clEnqueueWriteBuffer(queue, d_a, CL_TRUE, 0, inputImageBytes, h_a, 0, NULL, NULL);
    err |= clEnqueueWriteBuffer(queue, d_b, CL_TRUE, 0, outputImageBytes, h_b, 0, NULL, NULL);

    err = clSetKernelArg(kernel, 0, sizeof(cl_mem), &d_a);
    err|= clSetKernelArg(kernel, 0, sizeof(cl_mem), &d_b);

    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &globalSize, &localSize, 0, NULL, NULL);

    clFinish(queue);

    clEnqueueReadBuffer(queue, d_b, CL_TRUE, 0, outputImageBytes, h_b, 0, NULL, NULL);
    std::cout<<h_a[10]<<" "<<h_b[10]<<std::endl;
    for(int i=0;i<n;i++){
        if(h_a[i] != h_b[i]){
            std::cout<<"Bad output: "<<h_b[i]<<" at: "<<i<<std::endl;
            return 0;
        }
    }

    clReleaseMemObject(d_a);
    clReleaseMemObject(d_b);
    clReleaseProgram(program);
    clReleaseKernel(kernel);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);

    free(h_a);
    free(h_b);

}
