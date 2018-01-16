	.text
	.hsa_code_object_version 2,1
	.hsa_code_object_isa 9,0,0,"AMD","AMDGPU"
	.globl	Filter                  ; -- Begin function Filter
	.p2align	8
	.type	Filter,@function
	.amdgpu_hsa_kernel Filter
Filter:                                 ; @Filter
	.amd_kernel_code_t
		amd_code_version_major = 1
		amd_code_version_minor = 1
		amd_machine_kind = 1
		amd_machine_version_major = 9
		amd_machine_version_minor = 0
		amd_machine_version_stepping = 0
		kernel_code_entry_byte_offset = 256
		kernel_code_prefetch_byte_size = 0
		max_scratch_backing_memory_byte_size = 0
		granulated_workitem_vgpr_count = 9
		granulated_wavefront_sgpr_count = 5
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 1
		user_sgpr_count = 8
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 0
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 0
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 0
		enable_sgpr_queue_ptr = 0
		enable_sgpr_kernarg_segment_ptr = 1
		enable_sgpr_dispatch_id = 0
		enable_sgpr_flat_scratch_init = 1
		enable_sgpr_private_segment_size = 0
		enable_sgpr_grid_workgroup_count_x = 0
		enable_sgpr_grid_workgroup_count_y = 0
		enable_sgpr_grid_workgroup_count_z = 0
		enable_ordered_append_gds = 0
		private_element_size = 1
		is_ptr64 = 1
		is_dynamic_callstack = 1
		is_debug_enabled = 0
		is_xnack_enabled = 0
		workitem_private_segment_byte_size = 16384
		workgroup_group_segment_byte_size = 0
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 56
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 48
		workitem_vgpr_count = 38
		reserved_vgpr_first = 0
		reserved_vgpr_count = 0
		reserved_sgpr_first = 0
		reserved_sgpr_count = 0
		debug_wavefront_private_segment_offset_sgpr = 0
		debug_private_segment_buffer_sgpr = 0
		kernarg_segment_alignment = 4
		group_segment_alignment = 4
		private_segment_alignment = 4
		wavefront_size = 6
		call_convention = -1
		runtime_loader_kernel_symbol = 0
	.end_amd_kernel_code_t
; BB#0:
	s_mov_b32 s33, s9
	s_load_dwordx2 s[34:35], s[4:5], 0x0
	s_load_dwordx2 s[36:37], s[4:5], 0x8
	s_load_dwordx2 s[38:39], s[4:5], 0x10
	s_add_u32 flat_scratch_lo, s6, s33
	s_addc_u32 flat_scratch_hi, s7, 0
	s_getpc_b64 s[40:41]
	s_add_u32 s40, s40, _Z13get_global_idj@rel32@lo+4
	s_addc_u32 s41, s41, _Z13get_global_idj@rel32@hi+4
	v_mov_b32_e32 v0, 0
	s_mov_b32 s4, s33
	s_mov_b32 s32, s33
	s_swappc_b64 s[30:31], s[40:41]
	v_mov_b32_e32 v37, v1
	v_mov_b32_e32 v36, v0
	v_mov_b32_e32 v0, 1
	s_mov_b32 s4, s33
	s_swappc_b64 s[30:31], s[40:41]
	v_mov_b32_e32 v37, v0
	s_waitcnt lgkmcnt(0)
	v_mov_b32_e32 v0, s34
	v_mov_b32_e32 v2, v36
	s_getpc_b64 s[40:41]
	s_add_u32 s40, s40, _Z11read_imagef14ocl_image2d_roDv2_i@rel32@lo+4
	s_addc_u32 s41, s41, _Z11read_imagef14ocl_image2d_roDv2_i@rel32@hi+4
	s_mov_b32 s4, s33
	v_mov_b32_e32 v1, s35
	v_mov_b32_e32 v3, v37
	s_swappc_b64 s[30:31], s[40:41]
	v_mov_b32_e32 v35, v3
	v_mov_b32_e32 v34, v2
	v_mov_b32_e32 v33, v1
	v_mov_b32_e32 v32, v0
	v_mov_b32_e32 v0, s36
	v_mov_b32_e32 v2, v36
	s_mov_b32 s4, s33
	v_mov_b32_e32 v1, s37
	v_mov_b32_e32 v3, v37
	s_swappc_b64 s[30:31], s[40:41]
	v_add_f32_e32 v7, v35, v3
	v_add_f32_e32 v6, v34, v2
	v_mov_b32_e32 v2, v36
	v_add_f32_e32 v5, v33, v1
	v_add_f32_e32 v4, v32, v0
	v_mov_b32_e32 v0, s38
	s_getpc_b64 s[6:7]
	s_add_u32 s6, s6, _Z12write_imagef14ocl_image2d_woDv2_iDv4_f@rel32@lo+4
	s_addc_u32 s7, s7, _Z12write_imagef14ocl_image2d_woDv2_iDv4_f@rel32@hi+4
	s_mov_b32 s4, s33
	v_mov_b32_e32 v1, s39
	v_mov_b32_e32 v3, v37
	s_swappc_b64 s[30:31], s[6:7]
	s_endpgm
.Lfunc_end0:
	.size	Filter, .Lfunc_end0-Filter
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 248
; NumSgprs: 48
; NumVgprs: 38
; ScratchSize: 16384
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 5
; VGPRBlocks: 9
; NumSGPRsForWavesPerEU: 48
; NumVGPRsForWavesPerEU: 38
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-amd-amdhsa-opencl-gfx900"
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            Filter
    SymbolName:      'Filter@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Args:            
      - Name:            a
        TypeName:        image2d_t
        Size:            8
        Align:           8
        ValueKind:       Image
        ValueType:       Struct
        AddrSpaceQual:   Constant
        AccQual:         ReadOnly
      - Name:            b
        TypeName:        image2d_t
        Size:            8
        Align:           8
        ValueKind:       Image
        ValueType:       Struct
        AddrSpaceQual:   Constant
        AccQual:         ReadOnly
      - Name:            output
        TypeName:        image2d_t
        Size:            8
        Align:           8
        ValueKind:       Image
        ValueType:       Struct
        AddrSpaceQual:   Constant
        AccQual:         WriteOnly
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetX
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetY
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetZ
        ValueType:       I64
    CodeProps:       
      KernargSegmentSize: 56
      GroupSegmentFixedSize: 0
      PrivateSegmentFixedSize: 16384
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        48
      NumVGPRs:        38
      MaxFlatWorkgroupSize: 256
      IsDynamicCallStack: true
...

	.end_amd_amdgpu_hsa_metadata
