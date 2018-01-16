#include<stdio.h>
    #include<stdlib.h>
    #include<math.h>
    #include<CL/cl.h>

    const char *kernelSource ="\n" \
    "#pragma OPENCL EXTENSION cl_khr_fp64 : enable  \n" \
    "__kernel void vecAdd(  __global float *a,     \n" \
    "                       __global float *b,     \n" \
    "                       __global float *c,     \n" \
    "                   const unsigned int n)       \n" \
    "{                                              \n" \
    "   int id = get_global_id(0);                  \n" \
    "   float _a = a[id];                          \n" \
    "   float _b = b[id], _c = 0;                  \n" \
    "   if(id < n){                                 \n" \
    "       __asm volatile(\"v_add_f32 %0, %1, %2\":\"=v\"(_c):\"v\"(_a),\"v\"(_b) \n" \
    "}                                              \n" \
    "   c[id] = _c;                                 \n" \
    "}                                              \n" \
                                                    "\n";

    int main(){
        unsigned int n = 100000;

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
            h_a[i] = sinf(i)*sinf(i);
            h_b[i] = cosf(i)*cosf(i);
            h_c[i] = 0;
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

        kernel = clCreateKernel(program, "vecAdd", &err);

        d_a = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);
        d_b = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);
        d_c = clCreateBuffer(context, CL_MEM_READ_WRITE, bytes, NULL, NULL);

        err = clEnqueueWriteBuffer(queue, d_a, CL_TRUE, 0, bytes, h_a, 0, NULL, NULL);

        err |= clEnqueueWriteBuffer(queue, d_b, CL_TRUE, 0, bytes, h_b, 0, NULL, NULL);
        err |= clEnqueueWriteBuffer(queue, d_c, CL_TRUE, 0, bytes, h_c, 0, NULL, NULL);

        err = clSetKernelArg(kernel, 0, sizeof(cl_mem), &d_a);
        err|= clSetKernelArg(kernel, 1, sizeof(cl_mem), &d_b);
        err|= clSetKernelArg(kernel, 2, sizeof(cl_mem), &d_c);
        err|= clSetKernelArg(kernel, 3, sizeof(unsigned int), &n);

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
