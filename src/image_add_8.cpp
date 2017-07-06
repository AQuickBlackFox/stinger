#include<iostream>
#include<vector>
#include<string>
#include<fstream>
#include<sstream>
#include<CL/cl.h>
#include"cl_helper.h"

std::string LoadKernel(const char* name) {
    std::ifstream in(name);
    std::string result(
            (std::istreambuf_iterator<char>(in)),
            std::istreambuf_iterator<char>());
    return result;
}

cl_program CreateProgram(const std::string& source, cl_context context) {
    size_t lengths[1] = { source.size() };
    const char* sources[1] = { source.data() };

    cl_int error = 0;
    cl_program program = clCreateProgramWithSource(context, 1, sources, lengths, &error);
    return program;
}

int main(){
    unsigned int height = 64;
    unsigned int width  = 64;
    unsigned int n = height * width;

    cl_mem img_a = NULL;
    cl_mem img_b = NULL;
    cl_mem img_c = NULL;

    cl_platform_id platform_id = NULL;
    cl_device_id device_id = NULL;
    cl_context context = NULL;
    cl_command_queue queue = NULL;
    cl_program program = NULL;
    cl_kernel kernel = NULL;
    cl_uint ret_num_platforms, ret_num_devices;

    size_t bytes = n*sizeof(char);

    char* h_a = (char*)malloc(bytes);
    char* h_b = (char*)malloc(bytes);
    char* h_c = (char*)malloc(bytes);

    for(int i=0;i<n;i++){
        h_a[i] = 0x1;
        h_b[i] = 0x1;
        h_c[i] = 0x0;
    }

    cl_int err;


    err = clGetPlatformIDs(1, &platform_id, &ret_num_platforms);
    CL_CHECK(err);
    err = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_DEFAULT, 1, &device_id, &ret_num_devices);
    CL_CHECK(err);
    context = clCreateContext(NULL, 1, &device_id, NULL, NULL, &err);
    CL_CHECK(err);
    queue = clCreateCommandQueue(context, device_id, 0, &err);
    CL_CHECK(err);
    program = CreateProgram(LoadKernel("image.cl"), context);
    err = clBuildProgram(program, 1, &device_id, "-DFILTER_SIZE=1", NULL, NULL);
    CL_CHECK(err);
    kernel = clCreateKernel(program, "Filter", &err);
    CL_CHECK(err);

    size_t origin[3] = { 0 };
    size_t region[3] = { width, height, 1};

    static const cl_image_format format = { CL_RGBA, CL_UNORM_INT8 };
    img_a = clCreateImage2D(context, CL_MEM_READ_ONLY, &format,
                    width, height, 0, NULL, &err);
    CL_CHECK(err);
    err = clEnqueueWriteImage(queue, img_a, CL_TRUE,
                        origin, region, 0, 0, h_a, 0, NULL, NULL);
    CL_CHECK(err);

    img_b = clCreateImage2D(context, CL_MEM_READ_ONLY, &format,
                    width, height, 0, NULL, &err);
    CL_CHECK(err);
    err = clEnqueueWriteImage(queue, img_b, CL_TRUE,
                        origin, region, 0, 0, h_b, 0, NULL, NULL);
    CL_CHECK(err);


    img_c = clCreateImage2D(context, CL_MEM_WRITE_ONLY, &format,
                    width, height, 0, NULL, &err);
    CL_CHECK(err);

    err = clSetKernelArg(kernel, 0, sizeof(cl_mem), &img_a);
    err|= clSetKernelArg(kernel, 1, sizeof(cl_mem), &img_b);
    err|= clSetKernelArg(kernel, 2, sizeof(cl_mem), &img_c);
    CL_CHECK(err);

    size_t offset[3] = { 0 };
    size_t size[3]   = { width, height, 1 };

    err = clEnqueueNDRangeKernel(queue, kernel, 2, offset, size, NULL, 0, NULL, NULL);
    CL_CHECK(err);

    clFinish(queue);

    err = clEnqueueReadImage(queue, img_c, CL_TRUE,
                        origin, region, 0, 0, h_c, 0, NULL, NULL);
    CL_CHECK(err);

    std::cout<<(int)h_c[0]<<std::endl;

    clReleaseMemObject(img_a);
    clReleaseMemObject(img_b);
    clReleaseMemObject(img_c);
    clReleaseProgram(program);
    clReleaseKernel(kernel);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);

    free(h_a);
    free(h_b);
    free(h_c);
}
