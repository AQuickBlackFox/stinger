#include<iostream>
#include<vector>
#include<string>
#include<fstream>
#include<sstream>
#include<CL/cl.h>

#include"Tensor.h"
#include"Image.h"
#include"DataTypes.h"

int main(){
    unsigned int height = 64;
    unsigned int width  = 64;
    unsigned int n = height * width;

    typedef stinger::ushort5_5_5_1_t T;

    stinger::Tensor<T>A(width, height);
    stinger::Tensor<T>B(width, height);
    stinger::Tensor<float>C(width, height);

    T a = {16, 16, 16, 0};
    T b = {16, 16, 16, 0};
    float c = 0.0f;

    stinger::fill(A, a);
    stinger::fill(B, b);
    stinger::fill(C, c);

    Init();
    BuildProgram(LoadKernel("img_accumf.cl"), context);
    kernel = clCreateKernel(program, "Filter", &error);
    CL_CHECK(error);

    stinger::Image2D<T, CL_RGB, CL_UNORM_SHORT_555, CL_MEM_READ_ONLY>ImageA(A);
    stinger::Image2D<T, CL_RGB, CL_UNORM_SHORT_555, CL_MEM_READ_ONLY>ImageB(B);
    stinger::Image2D<float, CL_R, CL_FLOAT, CL_MEM_WRITE_ONLY>ImageC(C);
    ImageA.ToGPU();
    ImageB.ToGPU();

    error = clSetKernelArg(kernel, 0, sizeof(cl_mem), &(ImageA.img));
    error|= clSetKernelArg(kernel, 1, sizeof(cl_mem), &(ImageB.img));
    error|= clSetKernelArg(kernel, 2, sizeof(cl_mem), &(ImageC.img));
    CL_CHECK(error);

    size_t offset[3] = { 0 };
    size_t size[3]   = { width, height, 1 };

    error = clEnqueueNDRangeKernel(queue, kernel, 2, offset, size, NULL, 0, NULL, NULL);
    CL_CHECK(error);

    clFinish(queue);

    ImageC.FromGPU();

    std::cout<<C[0]<<std::endl;
/*
    for(int i=0;i<n;i++) {
        VALIDATE(C[i], A[i].x + B[i].x + A[i].y + B[i].y + A[i].z + B[i].z, i);
    }
    SUCCESS;
*/
}
