#include<iostream>
#include<vector>
#include<string>
#include<fstream>
#include<sstream>
#include<CL/cl.h>

#include"../Tensor.h"
#include"../Image.h"

int main(){
    unsigned int height = 1;
    unsigned int width  = 16;
    unsigned int n = height * width;

    typedef float T;

    stinger::Tensor<T>A(width, height);
    stinger::Tensor<T>B(width, height);
    stinger::Tensor<T>C(width, height);

    stinger::fill(A, T(2));
    stinger::fill(B, T(3));
    stinger::fill(C, T(0));

    Init();
    BuildProgram(LoadKernel("fadd.cl"), context);
    kernel = clCreateKernel(program, "fadd", &error);
    CL_CHECK(error);

    stinger::Buffer2D<T, CL_MEM_READ_ONLY>BufferA(A);
    stinger::Buffer2D<T, CL_MEM_READ_ONLY>BufferB(B);
    stinger::Buffer2D<T, CL_MEM_WRITE_ONLY>BufferC(C);
    BufferA.ToGPU();
    BufferB.ToGPU();

    error = clSetKernelArg(kernel, 0, sizeof(cl_mem), &(BufferA.buff));
    error|= clSetKernelArg(kernel, 1, sizeof(cl_mem), &(BufferB.buff));
    error|= clSetKernelArg(kernel, 2, sizeof(cl_mem), &(BufferC.buff));
    CL_CHECK(error);

    size_t offset[3] = { 0 };
    size_t size[3]   = { width, height, 1 };

    error = clEnqueueNDRangeKernel(queue, kernel, 2, offset, size, NULL, 0, NULL, NULL);
    CL_CHECK(error);

    clFinish(queue);

    BufferC.FromGPU();


    for(int i=0;i<n;i++){
        VALIDATE(C[i], A[i] + B[i], i);
    }
    SUCCESS;
}
