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
		granulated_workitem_vgpr_count = 2
		granulated_wavefront_sgpr_count = 2
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 0
		user_sgpr_count = 8
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 1
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 1
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 1
		enable_sgpr_queue_ptr = 0
		enable_sgpr_kernarg_segment_ptr = 1
		enable_sgpr_dispatch_id = 0
		enable_sgpr_flat_scratch_init = 0
		enable_sgpr_private_segment_size = 0
		enable_sgpr_grid_workgroup_count_x = 0
		enable_sgpr_grid_workgroup_count_y = 0
		enable_sgpr_grid_workgroup_count_z = 0
		enable_ordered_append_gds = 0
		private_element_size = 1
		is_ptr64 = 1
		is_dynamic_callstack = 0
		is_debug_enabled = 0
		is_xnack_enabled = 0
		workitem_private_segment_byte_size = 0
		workgroup_group_segment_byte_size = 0
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 56
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 18
		workitem_vgpr_count = 10
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
	s_mov_b64 s[10:11], exec
	s_wqm_b64 exec, exec
	v_mov_b32_e32 v2, s4
	v_mov_b32_e32 v3, s5
	global_load_ushort v2, v[2:3], off offset:6
	s_load_dwordx4 s[0:3], s[6:7], 0x18
	s_waitcnt lgkmcnt(0)
	s_load_dword s1, s[4:5], 0x4
	s_load_dwordx2 s[14:15], s[6:7], 0x10
	s_nop 0
	s_load_dwordx2 s[4:5], s[6:7], 0x0
	s_load_dwordx2 s[12:13], s[6:7], 0x8
	s_waitcnt lgkmcnt(0)
	s_and_b32 s1, s1, 0xffff
	s_mul_i32 s8, s8, s1
	v_add_i32_e32 v0, vcc, s8, v0
	v_add_i32_e32 v8, vcc, s0, v0
	v_cvt_f32_i32_e32 v0, v8
	v_floor_f32_e32 v4, v0
	s_waitcnt vmcnt(0)
	v_mul_lo_i32 v2, s9, v2
	v_add_i32_e32 v1, vcc, v1, v2
	v_add_i32_e32 v9, vcc, s2, v1
	v_cvt_f32_i32_e32 v1, v9
	v_floor_f32_e32 v5, v1
	s_and_b64 exec, exec, s[10:11]
	s_load_dwordx8 s[0:7], s[4:5], 0x0
	s_mov_b32 s11, 0
	s_brev_b32 s10, 1
	s_mov_b32 s9, 0xfff000
	s_mov_b32 s8, 0x1000b092
	s_waitcnt lgkmcnt(0)
	image_sample v[0:3], v[4:5], s[0:7], s[8:11] dmask:0xf
	s_load_dwordx8 s[0:7], s[12:13], 0x0
	s_waitcnt lgkmcnt(0)
	image_sample v[4:7], v[4:5], s[0:7], s[8:11] dmask:0xf
	s_load_dwordx8 s[0:7], s[14:15], 0x0
	s_waitcnt vmcnt(0)
	v_add_f32_e32 v3, v3, v7
	v_add_f32_e32 v2, v2, v6
	v_add_f32_e32 v1, v1, v5
	v_add_f32_e32 v0, v0, v4
	s_waitcnt lgkmcnt(0)
	image_store v[0:3], v[8:9], s[0:7] dmask:0xf unorm
	s_endpgm
.Lfunc_end0:
	.size	Filter, .Lfunc_end0-Filter
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 244
; NumSgprs: 18
; NumVgprs: 10
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 18
; NumVGPRsForWavesPerEU: 10
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1
	.type	__unnamed_1,@object     ; @0
	.section	.rodata,#alloc
	.p2align	2
__unnamed_1:
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480658               ; 0x1000b092
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268447890               ; 0x10003092
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480512               ; 0x1000b000
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268447744               ; 0x10003000
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480585               ; 0x1000b049
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268447817               ; 0x10003049
	.long	16773120                ; 0xfff000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268480658               ; 0x1000b092
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268447890               ; 0x10003092
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268480512               ; 0x1000b000
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268447744               ; 0x10003000
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268480585               ; 0x1000b049
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.long	268447817               ; 0x10003049
	.long	16773120                ; 0xfff000
	.long	5242880                 ; 0x500000
	.long	0                       ; 0x0
	.size	__unnamed_1, 416

	.type	__unnamed_2,@object     ; @1
	.p2align	2
__unnamed_2:
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268480658               ; 0x1000b092
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268447890               ; 0x10003092
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268480512               ; 0x1000b000
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268447744               ; 0x10003000
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268480585               ; 0x1000b049
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	268447817               ; 0x10003049
	.long	16773120                ; 0xfff000
	.long	2147483648              ; 0x80000000
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268480658               ; 0x1000b092
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268447890               ; 0x10003092
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268480950               ; 0x1000b1b6
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268448182               ; 0x100031b6
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268480512               ; 0x1000b000
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268447744               ; 0x10003000
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268480585               ; 0x1000b049
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.long	268447817               ; 0x10003049
	.long	16773120                ; 0xfff000
	.long	2152726528              ; 0x80500000
	.long	0                       ; 0x0
	.size	__unnamed_2, 416


	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
	.ident	"clang version 4.0 "
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
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        18
      NumVGPRs:        10
      MaxFlatWorkgroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
