	.text
	.section	.AMDGPU.config
	.long	47176
	.long	11272257
	.long	47180
	.long	132
	.long	47200
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	sample                  ; -- Begin function sample
	.p2align	8
	.type	sample,@function
sample:                                 ; @sample
; %bb.0:                                ; %main_body
	s_wqm_b64 exec, exec
	s_load_dwordx2 s[0:1], s[0:1], 0x24
	s_mov_b32 s4, 0
	s_mov_b32 s5, s4
	s_mov_b32 s6, s4
	s_mov_b32 s7, s4
	s_mov_b32 s8, s4
	s_mov_b32 s9, s4
	s_mov_b32 s10, s4
	s_mov_b32 s11, s4
	s_waitcnt lgkmcnt(0)
	image_sample v[0:3], v[0:3], s[4:11], s[0:3] dmask:0xf
	v_mov_b32_e32 v5, s1
	v_mov_b32_e32 v4, s0
	s_waitcnt vmcnt(0)
	global_store_dwordx4 v[4:5], v[0:3], off
	s_endpgm
.Lfunc_end0:
	.size	sample, .Lfunc_end0-sample
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 80
; NumSgprs: 12
; NumVgprs: 6
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 12
; NumVGPRsForWavesPerEU: 6
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0

	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-unknown-linux-gnu-gfx900"
