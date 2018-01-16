define amdgpu_kernel void @sample(<4 x float> addrspace(1)* %out) {
main_body:
  %r = call <4 x float> @llvm.amdgcn.image.sample.v4f32.v4f32.v8i32(<4 x float> undef, <8 x i32> undef, <4 x i32> undef, i32 15, i1 0, i1 0, i1 0, i1 0, i1 0)
  store <4 x float> %r, <4 x float> addrspace(1)* %out
  ret void
}

declare <4 x float> @llvm.amdgcn.image.sample.v4f32.v4f32.v8i32(<4 x float>, <8 x i32>, <4 x i32>, i32, i1, i1, i1, i1, i1)
