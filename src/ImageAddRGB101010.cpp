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

    typedef stinger::uint10_10_10_2_t T;

    stinger::Tensor<T>A(width, height);
    stinger::Tensor<T>B(width, height);
    stinger::Tensor<T>C(width, height);

    T a = {2, 2, 2, 0};
    T b = {3, 3, 3, 0};
    T c = {0, 0, 0, 0};

    stinger::fill(A, a);
    stinger::fill(B, b);
    stinger::fill(C, c);

    Init();
    BuildProgram(LoadKernel("./kernels/imagef.cl"), context);
    kernel = clCreateKernel(program, "Filter", &error);
    CL_CHECK(error);

    stinger::Image2D<T, CL_RGB, CL_UNORM_INT_101010, CL_MEM_READ_ONLY>ImageA(A);
    stinger::Image2D<T, CL_RGB, CL_UNORM_INT_101010, CL_MEM_READ_ONLY>ImageB(B);
    stinger::Image2D<T, CL_RGB, CL_UNORM_INT_101010, CL_MEM_WRITE_ONLY>ImageC(C);
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


    for(int i=0;i<n;i++) {
        VALIDATE(C[i].x, A[i].x + B[i].x, i);
    }
    SUCCESS;
}
