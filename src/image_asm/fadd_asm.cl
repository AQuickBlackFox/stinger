// Does simple floating point addition with inline asm

__kernel void fadd(__global float *A, __global float *B, __global float *C) {
    int gid = get_global_id(0);
    float a = A[gid];
    float b = B[gid];
    float c = C[gid];
    __asm volatile("v_add_f32 %0, %1, %2":"=v"(c):"v"(a),"v"(b));
    C[gid] = c;
}
