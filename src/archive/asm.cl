__kernel void hello(__global float* A, __global float *B, __global float *C) {
    int id = get_global_id(0);
    float a = A[id];
    float b = B[id];
    float c = 0.0f;
    __asm volatile("v_add_f32 %0, %1, %2":"=v"(c):"v"(a),"v"(b));
    C[id] = c;
}
