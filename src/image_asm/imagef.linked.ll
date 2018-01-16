; ModuleID = 'imagef.linked.bc'
source_filename = "llvm-link"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn-amd-amdhsa-opencl"

%opencl.image2d_ro_t = type opaque
%opencl.image2d_wo_t = type opaque

; Function Attrs: nounwind
define amdgpu_kernel void @Filter(%opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_ro_t addrspace(2)*, %opencl.image2d_wo_t addrspace(2)*) local_unnamed_addr #0 !kernel_arg_addr_space !4 !kernel_arg_access_qual !5 !kernel_arg_type !6 !kernel_arg_base_type !6 !kernel_arg_type_qual !7 !kernel_arg_name !8 {
  %4 = tail call i64 @_Z13get_global_idj(i32 0) #7
  %5 = trunc i64 %4 to i32
  %6 = insertelement <2 x i32> undef, i32 %5, i32 0
  %7 = tail call i64 @_Z13get_global_idj(i32 1) #7
  %8 = trunc i64 %7 to i32
  %9 = insertelement <2 x i32> %6, i32 %8, i32 1
  %10 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)* %0, <2 x i32> %9) #4
  %11 = tail call <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)* %1, <2 x i32> %9) #4
  %12 = fadd <4 x float> %10, %11
  tail call void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)* %2, <2 x i32> %9, <4 x float> %12) #5
  ret void
}

; Function Attrs: alwaysinline nounwind readonly
define linkonce_odr protected <4 x float> @_Z11read_imagef14ocl_image2d_roDv2_i(%opencl.image2d_ro_t addrspace(2)* readonly, <2 x i32>) local_unnamed_addr #1 {
  %3 = bitcast %opencl.image2d_ro_t addrspace(2)* %0 to i32 addrspace(2)*
  %4 = tail call <4 x float> @__ockl_image_load_2D(i32 addrspace(2)* %3, <2 x i32> %1) #4
  ret <4 x float> %4
}

; Function Attrs: alwaysinline nounwind
define linkonce_odr protected void @_Z12write_imagef14ocl_image2d_woDv2_iDv4_f(%opencl.image2d_wo_t addrspace(2)*, <2 x i32>, <4 x float>) local_unnamed_addr #2 {
  %4 = bitcast %opencl.image2d_wo_t addrspace(2)* %0 to i32 addrspace(2)*
  tail call void @__ockl_image_store_2D(i32 addrspace(2)* %4, <2 x i32> %1, <4 x float> %2) #5
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define linkonce_odr protected i64 @_Z13get_global_idj(i32) local_unnamed_addr #3 {
  %2 = tail call i64 @__ockl_get_global_id(i32 %0) #7
  ret i64 %2
}

; Function Attrs: alwaysinline nounwind readonly
define linkonce_odr protected <4 x float> @__ockl_image_load_2D(i32 addrspace(2)* nocapture readonly, <2 x i32>) local_unnamed_addr #1 {
  %3 = bitcast i32 addrspace(2)* %0 to <8 x i32> addrspace(2)*
  %4 = load <8 x i32>, <8 x i32> addrspace(2)* %3, align 32, !tbaa !9
  %5 = tail call <4 x float> @llvm.amdgcn.image.load.v4f32.v2i32.v8i32(<2 x i32> %1, <8 x i32> %4, i32 15, i1 zeroext false, i1 zeroext false, i1 zeroext false, i1 zeroext false) #4
  ret <4 x float> %5
}

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.load.v4f32.v2i32.v8i32(<2 x i32>, <8 x i32>, i32, i1, i1, i1, i1) #4

; Function Attrs: alwaysinline nounwind
define linkonce_odr protected void @__ockl_image_store_2D(i32 addrspace(2)* nocapture readonly, <2 x i32>, <4 x float>) local_unnamed_addr #2 {
  %4 = bitcast i32 addrspace(2)* %0 to <8 x i32> addrspace(2)*
  %5 = load <8 x i32>, <8 x i32> addrspace(2)* %4, align 32, !tbaa !9
  tail call void @llvm.amdgcn.image.store.v4f32.v2i32.v8i32(<4 x float> %2, <2 x i32> %1, <8 x i32> %5, i32 15, i1 zeroext false, i1 zeroext false, i1 zeroext false, i1 zeroext false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.amdgcn.image.store.v4f32.v2i32.v8i32(<4 x float>, <2 x i32>, <8 x i32>, i32, i1, i1, i1, i1) #5

; Function Attrs: alwaysinline nounwind readnone
define linkonce_odr protected i64 @__ockl_get_global_id(i32) local_unnamed_addr #3 {
  %2 = tail call i8 addrspace(2)* @llvm.amdgcn.dispatch.ptr() #7
  switch i32 %0, label %41 [
    i32 0, label %3
    i32 1, label %13
    i32 2, label %24
  ]

; <label>:3:                                      ; preds = %1
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x() #7
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x() #7
  %6 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 4
  %7 = bitcast i8 addrspace(2)* %6 to i16 addrspace(2)*
  %8 = load i16, i16 addrspace(2)* %7, align 4, !tbaa !12
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = add i32 %10, %4
  %12 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #7
  br label %35

; <label>:13:                                     ; preds = %1
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y() #7
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y() #7
  %16 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 6
  %17 = bitcast i8 addrspace(2)* %16 to i16 addrspace(2)*
  %18 = load i16, i16 addrspace(2)* %17, align 2, !tbaa !19
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #7
  %23 = getelementptr inbounds i8, i8 addrspace(2)* %22, i64 8
  br label %35

; <label>:24:                                     ; preds = %1
  %25 = tail call i32 @llvm.amdgcn.workitem.id.z() #7
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.z() #7
  %27 = getelementptr inbounds i8, i8 addrspace(2)* %2, i64 8
  %28 = bitcast i8 addrspace(2)* %27 to i16 addrspace(2)*
  %29 = load i16, i16 addrspace(2)* %28, align 8, !tbaa !20
  %30 = zext i16 %29 to i32
  %31 = mul i32 %26, %30
  %32 = add i32 %31, %25
  %33 = tail call i8 addrspace(2)* @llvm.amdgcn.implicitarg.ptr() #7
  %34 = getelementptr inbounds i8, i8 addrspace(2)* %33, i64 16
  br label %35

; <label>:35:                                     ; preds = %24, %13, %3
  %36 = phi i32 [ %32, %24 ], [ %21, %13 ], [ %11, %3 ]
  %37 = phi i8 addrspace(2)* [ %34, %24 ], [ %23, %13 ], [ %12, %3 ]
  %38 = zext i32 %36 to i64
  %39 = bitcast i8 addrspace(2)* %37 to i64 addrspace(2)*
  %40 = load i64, i64 addrspace(2)* %39, align 8, !tbaa !21
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

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { alwaysinline nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { alwaysinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { alwaysinline nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+fp64-fp16-denormals,-fp32-denormals" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone speculatable }
attributes #7 = { nounwind readnone }

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
!12 = !{!13, !14, i64 4}
!13 = !{!"hsa_kernel_dispatch_packet_s", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6, !14, i64 8, !14, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!14 = !{!"short", !10, i64 0}
!15 = !{!"int", !10, i64 0}
!16 = !{!"long", !10, i64 0}
!17 = !{!"any pointer", !10, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{!13, !14, i64 6}
!20 = !{!13, !14, i64 8}
!21 = !{!16, !16, i64 0}
