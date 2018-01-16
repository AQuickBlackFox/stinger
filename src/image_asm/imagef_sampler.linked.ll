; ModuleID = 'imagef_sampler.linked.bc'
source_filename = "llvm-link"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn-amd-amdhsa-opencl"

%opencl.image2d_ro_t = type opaque
%opencl.image2d_wo_t = type opaque
%opencl.sampler_t = type { i32, i32, i32, i32 }

@0 = internal addrspace(2) constant [104 x i32] [i32 268480950, i32 16773120, i32 0, i32 0, i32 268448182, i32 16773120, i32 0, i32 0, i32 268480658, i32 16773120, i32 0, i32 0, i32 268447890, i32 16773120, i32 0, i32 0, i32 268480950, i32 16773120, i32 0, i32 0, i32 268448182, i32 16773120, i32 0, i32 0, i32 268480512, i32 16773120, i32 0, i32 0, i32 268447744, i32 16773120, i32 0, i32 0, i32 268480585, i32 16773120, i32 0, i32 0, i32 268447817, i32 16773120, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 268480950, i32 16773120, i32 5242880, i32 0, i32 268448182, i32 16773120, i32 5242880, i32 0, i32 268480658, i32 16773120, i32 5242880, i32 0, i32 268447890, i32 16773120, i32 5242880, i32 0, i32 268480950, i32 16773120, i32 5242880, i32 0, i32 268448182, i32 16773120, i32 5242880, i32 0, i32 268480512, i32 16773120, i32 5242880, i32 0, i32 268447744, i32 16773120, i32 5242880, i32 0, i32 268480585, i32 16773120, i32 5242880, i32 0, i32 268447817, i32 16773120, i32 5242880, i32 0], align 4
@1 = internal addrspace(2) constant [104 x i32] [i32 268480950, i32 16773120, i32 -2147483648, i32 0, i32 268448182, i32 16773120, i32 -2147483648, i32 0, i32 268480658, i32 16773120, i32 -2147483648, i32 0, i32 268447890, i32 16773120, i32 -2147483648, i32 0, i32 268480950, i32 16773120, i32 -2147483648, i32 0, i32 268448182, i32 16773120, i32 -2147483648, i32 0, i32 268480512, i32 16773120, i32 -2147483648, i32 0, i32 268447744, i32 16773120, i32 -2147483648, i32 0, i32 268480585, i32 16773120, i32 -2147483648, i32 0, i32 268447817, i32 16773120, i32 -2147483648, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 268480950, i32 16773120, i32 -2142240768, i32 0, i32 268448182, i32 16773120, i32 -2142240768, i32 0, i32 268480658, i32 16773120, i32 -2142240768, i32 0, i32 268447890, i32 16773120, i32 -2142240768, i32 0, i32 268480950, i32 16773120, i32 -2142240768, i32 0, i32 268448182, i32 16773120, i32 -2142240768, i32 0, i32 268480512, i32 16773120, i32 -2142240768, i32 0, i32 268447744, i32 16773120, i32 -2142240768, i32 0, i32 268480585, i32 16773120, i32 -2142240768, i32 0, i32 268447817, i32 16773120, i32 -2142240768, i32 0], align 4

; Function Attrs: nounwind
define amdgpu_kernel void @Filter(%opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_wo_t addrspace(2)*) local_unnamed_addr #0 !kernel_arg_addr_space !4 !kernel_arg_access_qual !5 !kernel_arg_type !6 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 !kernel_arg_name !8 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #8
  %5 = trunc i64 %4 to i32
  %6 = insertelement <2 x i32> undef, i32 %5, i32 0
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #8
  %8 = trunc i64 %7 to i32
  %9 = insertelement <2 x i32> %6, i32 %8, i32 1
  %10 = tail call %opencl.sampler_t addrspace(2)* @__translate_sampler_initializer(i32 18) #5
  %11 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t addrspace(2)* %0, %opencl.sampler_t addrspace(2)* %10, <2 x i32> %9) #7
  %12 = tail call %opencl.sampler_t addrspace(2)* @__translate_sampler_initializer(i32 18) #5
  %13 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t addrspace(2)* %1, %opencl.sampler_t addrspace(2)* %12, <2 x i32> %9) #7
  %14 = fadd <4 x float> %11, %13
  tail call void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)* %2, <2 x i32> %9, <4 x float> %14) #5
  ret void
}

; Function Attrs: alwaysinline nounwind readonly
define linkonce_odr protected <4 x float> @_Z11read_imagef14ocl_image2d_ro11ocl_samplerDv2_i(%opencl.image2d_ro_t addrspace(2)* readonly, %opencl.sampler_t addrspace(2)* readonly, <2 x i32>) local_unnamed_addr #1 {
  %4 = bitcast %opencl.image2d_ro_t addrspace(2)* %0 to i32 addrspace(2)*
  %5 = getelementptr inbounds %opencl.sampler_t, %opencl.sampler_t addrspace(2)* %1, i64 0, i32 0
  %6 = tail call <2 x float> @_Z14convert_float2Dv2_i(<2 x i32> %2) #8
  %7 = tail call <4 x float> @__ockl_image_sample_2D(i32 addrspace(2)* %4, i32 addrspace(2)* %5, <2 x float> %6) #7
  ret <4 x float> %7
}

; Function Attrs: alwaysinline norecurse nounwind readnone
define linkonce_odr protected <2 x float> @_Z14convert_float2Dv2_i(<2 x i32>) local_unnamed_addr #2 {
  %2 = sitofp <2 x i32> %0 to <2 x float>
  ret <2 x float> %2
}

; Function Attrs: alwaysinline nounwind
define linkonce_odr protected void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)*, <2 x i32>, <4 x float>) local_unnamed_addr #3 {
  %4 = bitcast %opencl.image2d_wo_t addrspace(2)* %0 to i32 addrspace(2)*
  tail call void @__ockl_image_store_2D(i32 addrspace(2)* %4, <2 x i32> %1, <4 x float> %2) #5
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define linkonce_odr protected %opencl.sampler_t addrspace(2)* @__translate_sampler_initializer(i32) local_unnamed_addr #4 {
  %2 = tail call i32 @__oclc_ISA_version() #8
  %3 = icmp slt i32 %2, 900
  %4 = shl i32 %0, 2
  %5 = add i32 %4, -64
  %6 = sext i32 %5 to i64
  %7 = select i1 %3, [104 x i32] addrspace(2)* @0, [104 x i32] addrspace(2)* @1
  %8 = getelementptr inbounds [104 x i32], [104 x i32] addrspace(2)* %7, i64 0, i64 %6
  %9 = bitcast i32 addrspace(2)* %8 to %opencl.sampler_t addrspace(2)*
  ret %opencl.sampler_t addrspace(2)* %9
}

; Function Attrs: alwaysinline nounwind readnone
define linkonce_odr protected i64 @_Z13get_global_idj(i32) local_unnamed_addr #4 {
  %2 = tail call i64 @__ockl_get_global_id(i32 %0) #8
  ret i64 %2
}

; Function Attrs: alwaysinline nounwind
define linkonce_odr protected void @__ockl_image_store_2D(i32 addrspace(2)* nocapture readonly, <2 x i32>, <4 x float>) local_unnamed_addr #3 {
  %4 = bitcast i32 addrspace(2)* %0 to <8 x i32> addrspace(2)*
  %5 = load <8 x i32>, <8 x i32> addrspace(2)* %4, align 32, !tbaa !9
  tail call void @llvm.amdgcn.image.store.v4f32.v2i32.v8i32(<4 x float> %2, <2 x i32> %1, <8 x i32> %5, i32 15, i1 zeroext false, i1 zeroext false, i1 zeroext false, i1 zeroext false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.image.store.v4f32.v2i32.v8i32(<4 x float>, <2 x i32>, <8 x i32>, i32, i1, i1, i1, i1) #5

; Function Attrs: alwaysinline nounwind readonly
define linkonce_odr protected <4 x float> @__ockl_image_sample_2D(i32 addrspace(2)* nocapture readonly, i32 addrspace(2)* nocapture readonly, <2 x float>) local_unnamed_addr #1 {
  %4 = getelementptr inbounds i32, i32 addrspace(2)* %0, i64 2
  %5 = load i32, i32 addrspace(2)* %4, align 4, !tbaa !12
  %6 = and i32 %5, 16383
  %7 = add nuw nsw i32 %6, 1
  %8 = uitofp i32 %7 to float
  %9 = lshr i32 %5, 14
  %10 = and i32 %9, 16383
  %11 = add nuw nsw i32 %10, 1
  %12 = uitofp i32 %11 to float
  %13 = load i32, i32 addrspace(2)* %1, align 4, !tbaa !12
  %14 = and i32 %13, 32768
  %15 = icmp ne i32 %14, 0
  %16 = select i1 %15, float 1.000000e+00, float %8
  %17 = select i1 %15, float 1.000000e+00, float %12
  %18 = extractelement <2 x float> %2, i64 0
  %19 = fmul float %18, %16
  %20 = tail call float @llvm.floor.f32(float %19) #8
  %21 = tail call float @llvm.amdgcn.rcp.f32(float %16) #8
  %22 = fmul float %21, %20
  %23 = extractelement <2 x float> %2, i64 1
  %24 = fmul float %23, %17
  %25 = tail call float @llvm.floor.f32(float %24) #8
  %26 = tail call float @llvm.amdgcn.rcp.f32(float %17) #8
  %27 = fmul float %26, %25
  %28 = getelementptr inbounds i32, i32 addrspace(2)* %1, i64 2
  %29 = load i32, i32 addrspace(2)* %28, align 4, !tbaa !12
  %30 = and i32 %29, 1048576
  %31 = icmp ne i32 %30, 0
  %32 = select i1 %31, float %18, float %22
  %33 = insertelement <2 x float> undef, float %32, i64 0
  %34 = select i1 %31, float %23, float %27
  %35 = insertelement <2 x float> %33, float %34, i64 1
  %36 = bitcast i32 addrspace(2)* %0 to <8 x i32> addrspace(2)*
  %37 = load <8 x i32>, <8 x i32> addrspace(2)* %36, align 32, !tbaa !9
  %38 = bitcast i32 addrspace(2)* %1 to <4 x i32> addrspace(2)*
  %39 = load <4 x i32>, <4 x i32> addrspace(2)* %38, align 16, !tbaa !9
  %40 = tail call <4 x float> @llvm.amdgcn.image.sample.v4f32.v2f32.v8i32(<2 x float> %35, <8 x i32> %37, <4 x i32> %39, i32 15, i1 zeroext false, i1 zeroext false, i1 zeroext false, i1 zeroext false, i1 zeroext false) #7
  ret <4 x float> %40
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.floor.f32(float) #6

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.rcp.f32(float) #6

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.sample.v4f32.v2f32.v8i32(<2 x float>, <8 x i32>, <4 x i32>, i32, i1, i1, i1, i1, i1) #7

; Function Attrs: alwaysinline nounwind readnone
define linkonce_odr protected i64 @__ockl_get_global_id(i32) local_unnamed_addr #4 {
  %2 = tail call i8 addrspace(2)* @llvm.amdgcn.dispatch.ptr() #8
  switch i32 %0, label %41 [
    i32 0, label %3
    i32 1, label %13
    i32 2, label %24
  ]

; <label>:3:                                      ; preds = %1
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x() #8
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x() #8
  %6 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 4
  %7 = bitcast i8 addrspace(2)* %6 to i16 addrspace(2)*
  %8 = load i16, i16 addrspace(2)* %7, align 4, !tbaa !14
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = add i32 %10, %4
  %12 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #8
  br label %35

; <label>:13:                                     ; preds = %1
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y() #8
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y() #8
  %16 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 6
  %17 = bitcast i8 addrspace(2)* %16 to i16 addrspace(2)*
  %18 = load i16, i16 addrspace(2)* %17, align 2, !tbaa !20
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #8
  %23 = getelementptr inbounds i8, i8 addrspace(2)* %22, i64 8
  br label %35

; <label>:24:                                     ; preds = %1
  %25 = tail call i32 @llvm.amdgcn.workitem.id.z() #8
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.z() #8
  %27 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 8
  %28 = bitcast i8 addrspace(2)* %27 to i16 addrspace(2)*
  %29 = load i16, i16 addrspace(2)* %28, align 8, !tbaa !21
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %25
  %33 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #8
  %34 = getelementptr inbounds i8, i8 addrspace(2)* %33, i64 16
  br label %35

; <label>:35:                                     ; preds = %24, %13, %3
  %36 = phi i32 [ %32, %24 ], [ %21, %13 ], [ %11, %3 ]
  %37 = phi i8 addrspace(2)* [ %34, %24 ], [ %23, %13 ], [ %12, %3 ]
  %38 = zext i32 %36 to i64
  %39 = bitcast i8 addrspace(2)* %37 to i64 addrspace(2)*
  %40 = load i64, i64 addrspace(2)* %39, align 8, !tbaa !22
  br label %41

; <label>:41:                                     ; preds = %35, %1
  %42 = phi i64 [ %38, %35 ], [ 0, %1 ]
  %43 = phi i64 [ %40, %35 ], [ 0, %1 ]
  %44 = add i64 %43, %42
  ret i64 %44
}

; Function Attrs: nounwind readnone speculatable
declare i8 addrspace(2)* @llvm.amdgcn.dispatch.ptr() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workgroup.id.x() #6

; Function Attrs: nounwind readnone speculatable
declare i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workitem.id.y() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workgroup.id.y() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workitem.id.z() #6

; Function Attrs: nounwind readnone speculatable
declare i32 @llvm.amdgcn.workgroup.id.z() #6

; Function Attrs: alwaysinline norecurse nounwind readnone
define linkonce_odr protected i32 @__oclc_ISA_version() local_unnamed_addr #2 {
  ret i32 900
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { alwaysinline norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { alwaysinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { alwaysinline nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone speculatable }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind readnone }

!opencl.ocl.version = !{!0, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.ident = !{!2, !2, !2, !2, !2, !2, !2, !2, !2}
!llvm.module.flags = !{!3}

!0 = !{i32 1, i32 2}
!1 = !{i32 2, i32 0}
!2 = !{!"clang version 4.0 "}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 1, i32 1, i32 1}
!5 = !{!"read_only", !"read_only", !"write_only"}
!6 = !{!"image2d_t", !"image2d_t", !"image2d_t"}
!7 = !{!"", !"", !""}
!8 = !{!"a", !"b", !"output"}
!9 = !{!10, !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !10, i64 0}
!14 = !{!15, !16, i64 4}
!15 = !{!"hsa_kernel_dispatch_packet_s", !16, i64 0, !16, i64 2, !16, i64 4, !16, i64 6, !16, i64 8, !16, i64 10, !13, i64 12, !13, i64 16, !13, i64 20, !13, i64 24, !13, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!16 = !{!"short", !10, i64 0}
!17 = !{!"long", !10, i64 0}
!18 = !{!"any pointer", !10, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!15, !16, i64 6}
!21 = !{!15, !16, i64 8}
!22 = !{!17, !17, i64 0}
