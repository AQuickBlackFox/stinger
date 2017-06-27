#include <iostream>
#include <CL/cl.h>

#define KERNEL(str) #str

#define MEM_SIZE 16

static char *source_str = KERNEL(
__kernel void hello(__global char* str){ 
    str[0] = 'H'; 
    str[1] = 'e'; 
    str[2] = 'l'; 
    str[3] = 'l'; 
    str[4] = 'o'; 
    str[5] = ','; 
    str[6] = ' '; 
    str[7] = 'W'; 
    str[8] = 'o'; 
    str[9] = 'r'; 
    str[10] = 'l'; 
    str[11] = 'd'; 
    str[12] = '!'; 
    str[13] = '\0'; 
});

int main(){
    cl_device_id device_id = NULL;
    cl_context context = NULL;
    cl_command_queue command_queue = NULL;
    cl_mem memobj = NULL;
    cl_program program = NULL;
    cl_kernel kernel = NULL;
    cl_platform_id platform_id = NULL;
    cl_uint ret_num_devices;
    cl_uint ret_num_platforms;
    cl_int ret;
    cl_command_queue_properties qprops = CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE;

    size_t source_size = 1024;

    ret = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_DEFAULT, 1, &device_id, &ret_num_devices);

    context = clCreateContext(NULL, 1, &device_id, NULL, NULL, &ret);

    command_queue = clCreateCommandQueueWithProperties(context, device_id, &qprops, &ret);

    memobj = clCreateBuffer(context, CL_MEM_READ_WRITE, MEM_SIZE*sizeof(char), NULL, &ret);

    program = clCreateProgramWithSource(context, 1, (const char**)&source_str, (const size_t*)&source_size, &ret);

    ret = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);

    kernel = clCreateKernel(program, "hello", &ret);

    ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void*)&memobj);

    ret = clEnqueueTask(command_queue, kernel, 0, NULL, NULL);
    char *src_str = (char*)malloc(MEM_SIZE);
    ret = clEnqueueReadBuffer(command_queue, memobj, CL_TRUE, 0, MEM_SIZE*sizeof(char), src_str, 0, NULL, NULL);

    ret = clFlush(command_queue);
    ret = clFinish(command_queue);
    ret = clReleaseKernel(kernel);
    ret = clReleaseProgram(program);
    ret = clReleaseMemObject(memobj);
    ret = clReleaseCommandQueue(command_queue);
    ret = clReleaseContext(context);

    return 0;
}
