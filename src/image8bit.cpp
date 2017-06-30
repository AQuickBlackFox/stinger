#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<CL/cl.h>
#include<iostream>
#include"cl_help.h"

const char *kernelSource = "\n"\
"__kernel void imageAdd(image2d_t input, \n" \
"                       image2d_t output)        \n" \
"{                                       \n" \
"   int x = get_global_id(0);           \n" \
"   float4 inp = read_imagef(input, int2(x, 0)); \n" \
"   write_imagef(output, int2(x, 0), inp); \n" \
"}                              \n" \
"\n";

int main() {
    unsigned n = 64;
    uint32_t  *h_a;
    uint32_t *h_b;
    std::cout<<kernelSource<<std::endl;
    cl_image_format inputFormat, outputFormat;
    inputFormat.image_channel_order = CL_RGBA;
    inputFormat.image_channel_data_type = CL_UNSIGNED_INT32;
    outputFormat.image_channel_order = CL_RGBA;
    outputFormat.image_channel_data_type = CL_UNSIGNED_INT32;

    cl_image_desc inputDesc, outputDesc;
    inputDesc.image_type = CL_MEM_OBJECT_IMAGE1D;
    outputDesc.image_type = CL_MEM_OBJECT_IMAGE1D;

    inputDesc.image_width = n;
    outputDesc.image_width = n;

    inputDesc.image_height = 1;
    outputDesc.image_height = 1;

    inputDesc.image_depth = 1;
    outputDesc.image_depth = 1;

    inputDesc.image_array_size = 1;
    outputDesc.image_array_size = 1;

    inputDesc.image_row_pitch = 1;
    outputDesc.image_row_pitch = 1;

    inputDesc.image_slice_pitch = 1;
    outputDesc.image_slice_pitch = 1;

    inputDesc.num_mip_levels = 0;
    outputDesc.num_mip_levels = 0;

    inputDesc.num_samples = 0;
    outputDesc.num_samples = 0;

    cl_mem d_a, d_b, img_a, img_b;

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
    std::cout<<localSize<<" "<<globalSize<<std::endl;
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
    err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
	CL_CHECK(err);

    kernel = clCreateKernel(program, "imageAdd", &err);
	CL_CHECK(err);

    d_a = clCreateBuffer(context, CL_MEM_READ_WRITE, inputImageBytes, NULL, &err);
	CL_CHECK(err);
    inputDesc.buffer = d_a;
    img_a = clCreateImage(context, CL_MEM_READ_WRITE, &inputFormat, &inputDesc, h_a, &err);

    d_b = clCreateBuffer(context, CL_MEM_READ_WRITE, outputImageBytes, NULL, &err);
	CL_CHECK(err);
    outputDesc.buffer = d_b;
    img_b = clCreateImage(context, CL_MEM_READ_WRITE, &outputFormat, &outputDesc, h_b, &err);

    err = clEnqueueWriteBuffer(queue, d_a, CL_TRUE, 0, inputImageBytes, h_a, 0, NULL, NULL);
    err |= clEnqueueWriteBuffer(queue, d_b, CL_TRUE, 0, outputImageBytes, h_b, 0, NULL, NULL);
	CL_CHECK(err);
    err = clSetKernelArg(kernel, 0, sizeof(cl_mem), &img_a);
    err|= clSetKernelArg(kernel, 0, sizeof(cl_mem), &img_b);
	CL_CHECK(err);

    err = clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &globalSize, &localSize, 0, NULL, NULL);
	CL_CHECK(err);
    clFinish(queue);

    err = clEnqueueReadBuffer(queue, d_b, CL_TRUE, 0, outputImageBytes, h_b, 0, NULL, NULL);
	CL_CHECK(err);
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
