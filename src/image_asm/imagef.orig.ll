; ModuleID = 'imagef.orig.bc'
source_filename = "imagef.cl"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn-amd-amdhsa-opencl"

%opencl.image2d_ro_t = type opaque
%opencl.image2d_wo_t = type opaque

; Function Attrs: nounwind
define amdgpu_kernel void @Filter(%opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_wo_t addrspace(2)*) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 !kernel_arg_name !7 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #4
  %5 = trunc i64 %4 to i32
  %6 = insertelement <2 x i32> undef, i32 %5, i32 0
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #4
  %8 = trunc i64 %7 to i32
  %9 = insertelement <2 x i32> %6, i32 %8, i32 1
  %10 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)* %0, <2 x i32> %9) #5
  %11 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)* %1, <2 x i32> %9) #5
  %12 = fadd <4 x float> %10, %11
  tail call void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)* %2, <2 x i32> %9, <4 x float> %12) #6
  ret void
}

; Function Attrs: nounwind readnone
declare i64 @_Z13get_global_idj(i32) local_unnamed_addr #1

; Function Attrs: nounwind readonly
declare <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)*, <2 x i32>) local_unnamed_addr #2

declare void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)*, <2 x i32>, <4 x float>) local_unnamed_addr #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, i32 2}
!2 = !{!"clang version 4.0 "}
!3 = !{i32 1, i32 1, i32 1}
!4 = !{!"read_only", !"read_only", !"write_only"}
!5 = !{!"image2d_t", !"image2d_t", !"image2d_t"}
!6 = !{!"", !"", !""}
!7 = !{!"a", !"b", !"output"}
