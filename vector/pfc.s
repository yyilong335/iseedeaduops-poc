	.file	"pfc.cpp"
	.text
	.section	.text._ZStanSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStanSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStanSt13_Ios_FmtflagsS_
	.type	_ZStanSt13_Ios_FmtflagsS_, @function
_ZStanSt13_Ios_FmtflagsS_:
.LFB1322:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	andl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1322:
	.size	_ZStanSt13_Ios_FmtflagsS_, .-_ZStanSt13_Ios_FmtflagsS_
	.section	.text._ZStorSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStorSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStorSt13_Ios_FmtflagsS_
	.type	_ZStorSt13_Ios_FmtflagsS_, @function
_ZStorSt13_Ios_FmtflagsS_:
.LFB1323:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	orl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1323:
	.size	_ZStorSt13_Ios_FmtflagsS_, .-_ZStorSt13_Ios_FmtflagsS_
	.section	.text._ZStcoSt13_Ios_Fmtflags,"axG",@progbits,_ZStcoSt13_Ios_Fmtflags,comdat
	.weak	_ZStcoSt13_Ios_Fmtflags
	.type	_ZStcoSt13_Ios_Fmtflags, @function
_ZStcoSt13_Ios_Fmtflags:
.LFB1325:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	notl	%eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1325:
	.size	_ZStcoSt13_Ios_Fmtflags, .-_ZStcoSt13_Ios_Fmtflags
	.section	.text._ZStoRRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStoRRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStoRRSt13_Ios_FmtflagsS_
	.type	_ZStoRRSt13_Ios_FmtflagsS_, @function
_ZStoRRSt13_Ios_FmtflagsS_:
.LFB1326:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStorSt13_Ios_FmtflagsS_
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1326:
	.size	_ZStoRRSt13_Ios_FmtflagsS_, .-_ZStoRRSt13_Ios_FmtflagsS_
	.section	.text._ZStaNRSt13_Ios_FmtflagsS_,"axG",@progbits,_ZStaNRSt13_Ios_FmtflagsS_,comdat
	.weak	_ZStaNRSt13_Ios_FmtflagsS_
	.type	_ZStaNRSt13_Ios_FmtflagsS_, @function
_ZStaNRSt13_Ios_FmtflagsS_:
.LFB1327:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_
	movq	-8(%rbp), %rdx
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1327:
	.size	_ZStaNRSt13_Ios_FmtflagsS_, .-_ZStaNRSt13_Ios_FmtflagsS_
	.section	.text._ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,"axG",@progbits,_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_,comdat
	.align 2
	.weak	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.type	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, @function
_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_:
.LFB1356:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, %edi
	call	_ZStcoSt13_Ios_Fmtflags
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStaNRSt13_Ios_FmtflagsS_
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_ZStanSt13_Ios_FmtflagsS_
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStoRRSt13_Ios_FmtflagsS_
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1356:
	.size	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_, .-_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	.section	.text._ZSt5rightRSt8ios_base,"axG",@progbits,_ZSt5rightRSt8ios_base,comdat
	.weak	_ZSt5rightRSt8ios_base
	.type	_ZSt5rightRSt8ios_base, @function
_ZSt5rightRSt8ios_base:
.LFB1382:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$176, %edx
	movl	$128, %esi
	movq	%rax, %rdi
	call	_ZNSt8ios_base4setfESt13_Ios_FmtflagsS0_
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1382:
	.size	_ZSt5rightRSt8ios_base, .-_ZSt5rightRSt8ios_base
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZSt4setwi,"axG",@progbits,_ZSt4setwi,comdat
	.weak	_ZSt4setwi
	.type	_ZSt4setwi, @function
_ZSt4setwi:
.LFB2322:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2322:
	.size	_ZSt4setwi, .-_ZSt4setwi
	.globl	pfc_mem
	.bss
	.align 8
	.type	pfc_mem, @object
	.size	pfc_mem, 8
pfc_mem:
	.zero	8
	.globl	pfc_configs
	.align 32
	.type	pfc_configs, @object
	.size	pfc_configs, 88000
pfc_configs:
	.zero	88000
	.globl	n_pfc_configs
	.align 8
	.type	n_pfc_configs, @object
	.size	n_pfc_configs, 8
n_pfc_configs:
	.zero	8
	.globl	pfc_config_file_content_hardcoded
	.data
	.align 32
	.type	pfc_config_file_content_hardcoded, @object
	.size	pfc_config_file_content_hardcoded, 1024
pfc_config_file_content_hardcoded:
	.string	"C6.01.CTR=0.MSR_PF=0x12 FRONTEND_RETIRED.L1I_MISS\nD1.08 MEM_LOAD_RETIRED.L1_MISS\nD1.10 MEM_LOAD_RETIRED.L2_MISS\nD1.20 MEM_LOAD_RETIRED.L3_MISS"
	.zero	881
	.globl	msr_configs
	.bss
	.align 32
	.type	msr_configs, @object
	.size	msr_configs, 184000
msr_configs:
	.zero	184000
	.globl	n_msr_configs
	.align 8
	.type	n_msr_configs, @object
	.size	n_msr_configs, 8
n_msr_configs:
	.zero	8
	.globl	msr_config_file_content
	.align 8
	.type	msr_config_file_content, @object
	.size	msr_config_file_content, 8
msr_config_file_content:
	.zero	8
	.globl	cur_rdmsr
	.align 8
	.type	cur_rdmsr, @object
	.size	cur_rdmsr, 8
cur_rdmsr:
	.zero	8
	.globl	is_Intel_CPU
	.align 4
	.type	is_Intel_CPU, @object
	.size	is_Intel_CPU, 4
is_Intel_CPU:
	.zero	4
	.globl	is_AMD_CPU
	.align 4
	.type	is_AMD_CPU, @object
	.size	is_AMD_CPU, 4
is_AMD_CPU:
	.zero	4
	.globl	n_programmable_counters
	.align 4
	.type	n_programmable_counters, @object
	.size	n_programmable_counters, 4
n_programmable_counters:
	.zero	4
	.globl	cpu
	.data
	.align 4
	.type	cpu, @object
	.size	cpu, 4
cpu:
	.long	-1
	.globl	verbose
	.bss
	.align 4
	.type	verbose, @object
	.size	verbose, 4
verbose:
	.zero	4
	.globl	measurement_results
	.align 32
	.type	measurement_results, @object
	.size	measurement_results, 48
measurement_results:
	.zero	48
	.text
	.globl	_Z18build_cpuid_stringPcjjjj
	.type	_Z18build_cpuid_stringPcjjjj, @function
_Z18build_cpuid_stringPcjjjj:
.LFB2337:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	%r8d, -24(%rbp)
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-8(%rbp), %rax
	leaq	12(%rax), %rdx
	movl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2337:
	.size	_Z18build_cpuid_stringPcjjjj, .-_Z18build_cpuid_stringPcjjjj
	.section	.rodata
.LC0:
	.string	"Vendor ID: %s\n"
.LC1:
	.string	"Brand: %s\n"
	.align 8
.LC2:
	.string	"DisplayFamily_DisplayModel: %.2X_%.2XH\n"
.LC3:
	.string	"Stepping ID: %u\n"
.LC4:
	.string	"GenuineIntel"
	.align 8
.LC5:
	.string	"Performance monitoring version: %u\n"
	.align 8
.LC6:
	.string	"Error: performance monitoring version >= 2 required\n"
	.align 8
.LC7:
	.string	"Number of general-purpose performance counters: %u\n"
	.align 8
.LC8:
	.string	"Error: only %u programmable counters available; nanoBench requires at least 2\n"
	.align 8
.LC9:
	.string	"Bit widths of general-purpose performance counters: %u\n"
.LC10:
	.string	"AuthenticAMD"
.LC11:
	.string	"Error: unsupported CPU found\n"
	.text
	.globl	_Z11check_cpuidv
	.type	_Z11check_cpuidv, @function
_Z11check_cpuidv:
.LFB2338:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
#APP
# 110 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movb	$0, -96(%rbp)
	movl	-128(%rbp), %ecx
	movl	-124(%rbp), %edx
	movl	-132(%rbp), %esi
	leaq	-112(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	_Z18build_cpuid_stringPcjjjj
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L19
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L19:
	movl	$-2147483646, %eax
#APP
# 117 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	movl	-124(%rbp), %edi
	movl	-128(%rbp), %ecx
	movl	-132(%rbp), %edx
	movl	-136(%rbp), %esi
	leaq	-80(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_Z18build_cpuid_stringPcjjjj
	movl	$-2147483645, %eax
#APP
# 119 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	leaq	-80(%rbp), %rax
	addq	$16, %rax
	movl	-124(%rbp), %edi
	movl	-128(%rbp), %ecx
	movl	-132(%rbp), %edx
	movl	-136(%rbp), %esi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_Z18build_cpuid_stringPcjjjj
	movl	$-2147483644, %eax
#APP
# 121 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	leaq	-80(%rbp), %rax
	addq	$32, %rax
	movl	-124(%rbp), %edi
	movl	-128(%rbp), %ecx
	movl	-132(%rbp), %edx
	movl	-136(%rbp), %esi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_Z18build_cpuid_stringPcjjjj
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L20
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L20:
	movl	$1, %eax
#APP
# 125 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	movl	-136(%rbp), %eax
	shrl	$8, %eax
	andl	$15, %eax
	movl	%eax, -144(%rbp)
	cmpl	$15, -144(%rbp)
	jne	.L21
	movl	-136(%rbp), %eax
	shrl	$20, %eax
	movzbl	%al, %eax
	addl	%eax, -144(%rbp)
.L21:
	movl	-136(%rbp), %eax
	shrl	$4, %eax
	andl	$15, %eax
	movl	%eax, -140(%rbp)
	cmpl	$6, -144(%rbp)
	je	.L22
	cmpl	$15, -144(%rbp)
	jne	.L23
.L22:
	movl	-136(%rbp), %eax
	shrl	$12, %eax
	andl	$240, %eax
	addl	%eax, -140(%rbp)
.L23:
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L24
	movl	-140(%rbp), %edx
	movl	-144(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L24:
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L25
	movl	-136(%rbp), %eax
	andl	$15, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L25:
	leaq	-112(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L26
	movl	$1, is_Intel_CPU(%rip)
	movl	$10, %eax
#APP
# 140 "pfc.cpp" 1
	cpuid
	
# 0 "" 2
#NO_APP
	movl	%ebx, %esi
	movl	%eax, -136(%rbp)
	movl	%esi, -132(%rbp)
	movl	%ecx, -128(%rbp)
	movl	%edx, -124(%rbp)
	movl	-136(%rbp), %eax
	movzbl	%al, %eax
	movl	%eax, -120(%rbp)
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L27
	movl	-120(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L27:
	cmpl	$1, -120(%rbp)
	ja	.L28
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$1, %eax
	jmp	.L36
.L28:
	movl	-136(%rbp), %eax
	shrl	$8, %eax
	andl	$255, %eax
	movl	%eax, -116(%rbp)
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L30
	movl	-116(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L30:
	cmpl	$3, -116(%rbp)
	jbe	.L31
	movl	$4, n_programmable_counters(%rip)
	jmp	.L32
.L31:
	cmpl	$1, -116(%rbp)
	jbe	.L33
	movl	$2, n_programmable_counters(%rip)
	jmp	.L32
.L33:
	movq	stderr(%rip), %rax
	movl	-116(%rbp), %edx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$1, %eax
	jmp	.L36
.L32:
	movl	verbose(%rip), %eax
	testl	%eax, %eax
	je	.L34
	movl	-136(%rbp), %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L34
.L26:
	leaq	-112(%rbp), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L35
	movl	$1, is_AMD_CPU(%rip)
	movl	$6, n_programmable_counters(%rip)
	jmp	.L34
.L35:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$1, %eax
	jmp	.L36
.L34:
	movl	$0, %eax
.L36:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L37
	call	__stack_chk_fail@PLT
.L37:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2338:
	.size	_Z11check_cpuidv, .-_Z11check_cpuidv
	.section	.rodata
.LC12:
	.string	" \t"
.LC13:
	.string	"config string too long: %s\n"
.LC14:
	.string	"."
.LC15:
	.string	"invalid configuration: %s\n"
.LC16:
	.string	"AnyT"
.LC17:
	.string	"EDG"
.LC18:
	.string	"INV"
.LC19:
	.string	"CTR="
.LC20:
	.string	"invalid counter: %s\n"
.LC21:
	.string	"CMSK="
.LC22:
	.string	"MSR_3F6H="
.LC23:
	.string	"MSR_PF="
.LC24:
	.string	"MSR_RSP0="
.LC25:
	.string	"MSR_RSP1="
.LC26:
	.string	"\n"
	.text
	.globl	_Z21parse_counter_configsv
	.type	_Z21parse_counter_configsv, @function
_Z21parse_counter_configsv:
.LFB2339:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$0, n_pfc_configs(%rip)
	leaq	pfc_config_file_content_hardcoded(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	addq	$1, %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, -128(%rbp)
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rax
	leaq	pfc_config_file_content_hardcoded(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-128(%rbp), %rax
	movq	%rax, -160(%rbp)
	jmp	.L39
.L61:
	movq	-168(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L63
	movq	-168(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$35, %al
	je	.L63
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	72+pfc_configs(%rip), %rax
	movl	$0, (%rdx,%rax)
	leaq	-168(%rbp), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strsep@PLT
	movq	%rax, -120(%rbp)
	movq	-168(%rbp), %rax
	testq	%rax, %rax
	je	.L43
	movq	-168(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L43
	movq	n_pfc_configs(%rip), %rdx
	movq	-168(%rbp), %rcx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	80+pfc_configs(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	jmp	.L44
.L43:
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	80+pfc_configs(%rip), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, (%rcx,%rdx)
.L44:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$49, %rax
	jbe	.L45
	movq	stderr(%rip), %rax
	movq	-120(%rbp), %rdx
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	jmp	.L39
.L45:
	movq	-120(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, -152(%rbp)
	leaq	-152(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strsep@PLT
	movq	%rax, -112(%rbp)
	movq	n_pfc_configs(%rip), %rbx
	movq	-112(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	movq	-152(%rbp), %rax
	testq	%rax, %rax
	jne	.L46
	movq	stderr(%rip), %rax
	movq	-120(%rbp), %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	jmp	.L39
.L46:
	leaq	-152(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strsep@PLT
	movq	%rax, -104(%rbp)
	movq	n_pfc_configs(%rip), %rbx
	movq	-104(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	8+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	jmp	.L47
.L60:
	movq	-96(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L48
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	24+pfc_configs(%rip), %rax
	movl	$1, (%rdx,%rax)
	jmp	.L47
.L48:
	movq	-96(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L49
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	28+pfc_configs(%rip), %rax
	movl	$1, (%rdx,%rax)
	jmp	.L47
.L49:
	movq	-96(%rbp), %rax
	leaq	.LC18(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L50
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	32+pfc_configs(%rip), %rax
	movl	$1, (%rdx,%rax)
	jmp	.L47
.L50:
	movq	-96(%rbp), %rax
	movl	$4, %edx
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L51
	movq	-96(%rbp), %rax
	addq	$4, %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, -144(%rbp)
	movl	n_programmable_counters(%rip), %eax
	movslq	%eax, %rdx
	movq	-144(%rbp), %rax
	cmpq	%rax, %rdx
	jnb	.L52
	movq	stderr(%rip), %rax
	movq	-96(%rbp), %rdx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	jmp	.L47
.L52:
	movq	n_pfc_configs(%rip), %rax
	movq	%rax, -88(%rbp)
	jmp	.L53
.L54:
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	72+pfc_configs(%rip), %rax
	movl	$1, (%rdx,%rax)
	movq	n_pfc_configs(%rip), %rax
	addq	$1, %rax
	movq	%rax, n_pfc_configs(%rip)
.L53:
	movq	n_pfc_configs(%rip), %rax
	movl	n_programmable_counters(%rip), %edx
	movslq	%edx, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	-144(%rbp), %rax
	cmpq	%rax, %rdx
	jne	.L54
	movq	n_pfc_configs(%rip), %rax
	cmpq	%rax, -88(%rbp)
	je	.L47
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	pfc_configs(%rip), %rdx
	movq	-88(%rbp), %rsi
	movq	%rsi, %rax
	salq	$2, %rax
	addq	%rsi, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	salq	$3, %rax
	movq	%rax, %rsi
	leaq	pfc_configs(%rip), %rax
	movq	(%rsi,%rax), %r8
	movq	8(%rsi,%rax), %r9
	movq	%r8, (%rcx,%rdx)
	movq	%r9, 8(%rcx,%rdx)
	movq	16(%rsi,%rax), %r8
	movq	24(%rsi,%rax), %r9
	movq	%r8, 16(%rcx,%rdx)
	movq	%r9, 24(%rcx,%rdx)
	movq	32(%rsi,%rax), %r8
	movq	40(%rsi,%rax), %r9
	movq	%r8, 32(%rcx,%rdx)
	movq	%r9, 40(%rcx,%rdx)
	movq	48(%rsi,%rax), %r8
	movq	56(%rsi,%rax), %r9
	movq	%r8, 48(%rcx,%rdx)
	movq	%r9, 56(%rcx,%rdx)
	movq	64(%rsi,%rax), %r8
	movq	72(%rsi,%rax), %r9
	movq	%r8, 64(%rcx,%rdx)
	movq	%r9, 72(%rcx,%rdx)
	movq	80(%rsi,%rax), %rax
	movq	%rax, 80(%rcx,%rdx)
	movq	n_pfc_configs(%rip), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	72+pfc_configs(%rip), %rax
	movl	$0, (%rdx,%rax)
	jmp	.L47
.L51:
	movq	-96(%rbp), %rax
	movl	$5, %edx
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L56
	movq	-96(%rbp), %rax
	addq	$5, %rax
	movq	n_pfc_configs(%rip), %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	16+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	jmp	.L47
.L56:
	movq	-96(%rbp), %rax
	movl	$9, %edx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L57
	movq	-96(%rbp), %rax
	addq	$9, %rax
	movq	n_pfc_configs(%rip), %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	40+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	jmp	.L47
.L57:
	movq	-96(%rbp), %rax
	movl	$7, %edx
	leaq	.LC23(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L58
	movq	-96(%rbp), %rax
	addq	$7, %rax
	movq	n_pfc_configs(%rip), %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	48+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	jmp	.L47
.L58:
	movq	-96(%rbp), %rax
	movl	$9, %edx
	leaq	.LC24(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L59
	movq	-96(%rbp), %rax
	addq	$9, %rax
	movq	n_pfc_configs(%rip), %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	56+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
	jmp	.L47
.L59:
	movq	-96(%rbp), %rax
	movl	$9, %edx
	leaq	.LC25(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	testl	%eax, %eax
	jne	.L47
	movq	-96(%rbp), %rax
	addq	$9, %rax
	movq	n_pfc_configs(%rip), %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	salq	$2, %rax
	addq	%rbx, %rax
	addq	%rax, %rax
	addq	%rbx, %rax
	salq	$3, %rax
	movq	%rax, %rcx
	leaq	64+pfc_configs(%rip), %rax
	movq	%rdx, (%rcx,%rax)
.L47:
	leaq	-152(%rbp), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strsep@PLT
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	setne	%al
	testb	%al, %al
	jne	.L60
	movq	n_pfc_configs(%rip), %rax
	addq	$1, %rax
	movq	%rax, n_pfc_configs(%rip)
	jmp	.L39
.L63:
	nop
.L39:
	leaq	-160(%rbp), %rax
	leaq	.LC26(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strsep@PLT
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L61
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L62
	call	__stack_chk_fail@PLT
.L62:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2339:
	.size	_Z21parse_counter_configsv, .-_Z21parse_counter_configsv
	.section	.rodata
.LC27:
	.string	"r"
.LC28:
	.string	"Error reading from \"%s\""
	.text
	.globl	_Z19read_value_from_cmdPc
	.type	_Z19read_value_from_cmdPc, @function
_Z19read_value_from_cmdPc:
.LFB2340:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	popen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	sete	%al
	testb	%al, %al
	je	.L65
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$0, %eax
	jmp	.L67
.L65:
	movq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$20, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	pclose@PLT
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
.L67:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L68
	call	__stack_chk_fail@PLT
.L68:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2340:
	.size	_Z19read_value_from_cmdPc, .-_Z19read_value_from_cmdPc
	.section	.rodata
.LC29:
	.string	"rdmsr -c -p%d %#x"
	.text
	.globl	_Z8read_msrj
	.type	_Z8read_msrj, @function
_Z8read_msrj:
.LFB2341:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	cpu(%rip), %edx
	movl	-68(%rbp), %ecx
	leaq	-64(%rbp), %rax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC29(%rip), %rdx
	movl	$50, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_Z19read_value_from_cmdPc
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L71
	call	__stack_chk_fail@PLT
.L71:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2341:
	.size	_Z8read_msrj, .-_Z8read_msrj
	.section	.rodata
.LC30:
	.string	"wrmsr -p%d %#x %#lx"
	.align 8
.LC31:
	.string	"\"%s\" failed. You may need to disable Secure Boot (see README.md)."
	.text
	.globl	_Z9write_msrjm
	.type	_Z9write_msrjm, @function
_Z9write_msrjm:
.LFB2342:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	cpu(%rip), %edx
	movq	-80(%rbp), %rsi
	movl	-68(%rbp), %ecx
	leaq	-64(%rbp), %rax
	movq	%rsi, %r9
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC30(%rip), %rdx
	movl	$50, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	system@PLT
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L75
	movq	stderr(%rip), %rax
	leaq	-64(%rbp), %rdx
	leaq	.LC31(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	stderr(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$1, %edi
	call	exit@PLT
.L75:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L74
	call	__stack_chk_fail@PLT
.L74:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2342:
	.size	_Z9write_msrjm, .-_Z9write_msrjm
	.globl	_Z22configure_perf_ctrs_FFjj
	.type	_Z22configure_perf_ctrs_FFjj, @function
_Z22configure_perf_ctrs_FFjj:
.LFB2343:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	is_Intel_CPU(%rip), %eax
	testl	%eax, %eax
	je	.L80
	movl	$911, %edi
	call	_Z8read_msrj
	movq	%rax, -16(%rbp)
	movabsq	$30064771087, %rax
	orq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$911, %edi
	call	_Z9write_msrjm
	movl	$909, %edi
	call	_Z8read_msrj
	movq	%rax, -8(%rbp)
	andq	$-4096, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$909, %edi
	call	_Z9write_msrjm
	movl	$0, -20(%rbp)
	jmp	.L78
.L79:
	movl	-20(%rbp), %eax
	addl	$777, %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	_Z9write_msrjm
	addl	$1, -20(%rbp)
.L78:
	cmpl	$2, -20(%rbp)
	jle	.L79
	movl	-40(%rbp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	sall	$4, %eax
	orl	%edx, %eax
	orl	-40(%rbp), %eax
	movl	%eax, %eax
	orq	%rax, -8(%rbp)
	movl	-36(%rbp), %eax
	sall	$9, %eax
	movl	%eax, %edx
	movl	-36(%rbp), %eax
	sall	$5, %eax
	orl	%eax, %edx
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	orl	%edx, %eax
	movl	%eax, %eax
	orq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$909, %edi
	call	_Z9write_msrjm
.L80:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2343:
	.size	_Z22configure_perf_ctrs_FFjj, .-_Z22configure_perf_ctrs_FFjj
	.section	.rodata
.LC32:
	.string	"Read invalid cfg"
	.align 8
.LC33:
	.string	"Measurement code not adapted fro AMD"
	.text
	.globl	_Z32configure_perf_ctrs_programmableiijj
	.type	_Z32configure_perf_ctrs_programmableiijj, @function
_Z32configure_perf_ctrs_programmableiijj:
.LFB2344:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 3, -24
	movl	%edi, -148(%rbp)
	movl	%esi, -152(%rbp)
	movl	%edx, -156(%rbp)
	movl	%ecx, -160(%rbp)
	movl	is_Intel_CPU(%rip), %eax
	testl	%eax, %eax
	je	.L82
	movl	$911, %edi
	call	_Z8read_msrj
	movq	%rax, -120(%rbp)
	movabsq	$30064771087, %rax
	orq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movl	$911, %edi
	call	_Z9write_msrjm
	movl	$0, -136(%rbp)
	jmp	.L83
.L92:
	movl	-136(%rbp), %eax
	addl	$390, %eax
	movl	%eax, %edi
	call	_Z8read_msrj
	movq	%rax, -128(%rbp)
	movabsq	$-4294967296, %rax
	andq	%rax, -128(%rbp)
	movl	-136(%rbp), %eax
	addl	$390, %eax
	movl	%eax, %edx
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	_Z9write_msrjm
	movl	-136(%rbp), %eax
	addl	$193, %eax
	movl	$0, %esi
	movl	%eax, %edi
	call	_Z9write_msrjm
	movl	-148(%rbp), %edx
	movl	-136(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -152(%rbp)
	jle	.L96
	movl	-148(%rbp), %edx
	movl	-136(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	pfc_configs(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	8(%rdx,%rax), %rbx
	movq	%rcx, -112(%rbp)
	movq	%rbx, -104(%rbp)
	movq	16(%rdx,%rax), %rcx
	movq	24(%rdx,%rax), %rbx
	movq	%rcx, -96(%rbp)
	movq	%rbx, -88(%rbp)
	movq	32(%rdx,%rax), %rcx
	movq	40(%rdx,%rax), %rbx
	movq	%rcx, -80(%rbp)
	movq	%rbx, -72(%rbp)
	movq	48(%rdx,%rax), %rcx
	movq	56(%rdx,%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	64(%rdx,%rax), %rcx
	movq	72(%rdx,%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	80(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	movl	-40(%rbp), %eax
	testl	%eax, %eax
	je	.L86
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L91
.L86:
	movq	-96(%rbp), %rax
	salq	$24, %rax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	movl	-80(%rbp), %eax
	sall	$23, %eax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	orq	$4194304, -128(%rbp)
	movl	-88(%rbp), %eax
	sall	$21, %eax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	movl	-84(%rbp), %eax
	sall	$18, %eax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	movl	-160(%rbp), %eax
	sall	$17, %eax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	movl	-156(%rbp), %eax
	sall	$16, %eax
	movl	%eax, %eax
	orq	%rax, -128(%rbp)
	movq	-104(%rbp), %rax
	salq	$8, %rax
	movzwl	%ax, %eax
	orq	%rax, -128(%rbp)
	movq	-112(%rbp), %rax
	movzbl	%al, %eax
	orq	%rax, -128(%rbp)
	movl	-136(%rbp), %eax
	addl	$390, %eax
	movl	%eax, %edx
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	%edx, %edi
	call	_Z9write_msrjm
	movq	-72(%rbp), %rax
	testq	%rax, %rax
	je	.L87
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$1014, %edi
	call	_Z9write_msrjm
.L87:
	movq	-64(%rbp), %rax
	testq	%rax, %rax
	je	.L88
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$1015, %edi
	call	_Z9write_msrjm
.L88:
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	je	.L89
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$422, %edi
	call	_Z9write_msrjm
.L89:
	movq	-48(%rbp), %rax
	testq	%rax, %rax
	je	.L91
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$423, %edi
	call	_Z9write_msrjm
	jmp	.L91
.L96:
	nop
.L91:
	addl	$1, -136(%rbp)
.L83:
	movl	n_programmable_counters(%rip), %eax
	cmpl	%eax, -136(%rbp)
	jl	.L92
	jmp	.L97
.L82:
	movl	$0, -132(%rbp)
	nop
	movl	n_programmable_counters(%rip), %eax
	cmpl	%eax, -132(%rbp)
	jge	.L97
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L97:
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2344:
	.size	_Z32configure_perf_ctrs_programmableiijj, .-_Z32configure_perf_ctrs_programmableiijj
	.section	.rodata
.LC34:
	.string	"Error reading %s\n"
	.text
	.globl	_Z9mmap_filePcPS_
	.type	_Z9mmap_filePcPS_, @function
_Z9mmap_filePcPS_:
.LFB2345:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	$2, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	lseek@PLT
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	$0, %r9d
	movl	%edx, %r8d
	movl	$2, %ecx
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	mmap@PLT
	movq	-32(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$-1, %rax
	jne	.L99
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC34(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L99:
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2345:
	.size	_Z9mmap_filePcPS_, .-_Z9mmap_filePcPS_
	.section	.rodata
.LC35:
	.string	"\t"
	.text
	.globl	_Z9pfc_printv
	.type	_Z9pfc_printv, @function
_Z9pfc_printv:
.LFB2346:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	$0, -128(%rbp)
	jmp	.L102
.L103:
	movq	-128(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	pfc_configs(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	8(%rdx,%rax), %rbx
	movq	%rcx, -112(%rbp)
	movq	%rbx, -104(%rbp)
	movq	16(%rdx,%rax), %rcx
	movq	24(%rdx,%rax), %rbx
	movq	%rcx, -96(%rbp)
	movq	%rbx, -88(%rbp)
	movq	32(%rdx,%rax), %rcx
	movq	40(%rdx,%rax), %rbx
	movq	%rcx, -80(%rbp)
	movq	%rbx, -72(%rbp)
	movq	48(%rdx,%rax), %rcx
	movq	56(%rdx,%rax), %rbx
	movq	%rcx, -64(%rbp)
	movq	%rbx, -56(%rbp)
	movq	64(%rdx,%rax), %rcx
	movq	72(%rdx,%rax), %rbx
	movq	%rcx, -48(%rbp)
	movq	%rbx, -40(%rbp)
	movq	80(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	movq	pfc_mem(%rip), %rdx
	movq	-128(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)
	leaq	_ZSt5rightRSt8ios_base(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSolsEPFRSt8ios_baseS0_E@PLT
	movq	%rax, %rbx
	movl	$20, %edi
	call	_ZSt4setwi
	movl	%eax, %esi
	movq	%rbx, %rdi
	call	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw@PLT
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEl@PLT
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	addq	$1, -128(%rbp)
.L102:
	cmpq	$3, -128(%rbp)
	jbe	.L103
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2346:
	.size	_Z9pfc_printv, .-_Z9pfc_printv
	.section	.rodata
.LC36:
	.string	"check_cpuid() failed"
	.align 8
.LC37:
	.string	"Error: Could not pin thread to core %d\n"
	.align 8
.LC38:
	.string	"More counters specified than CPU can handle: %zd > %d\n"
	.text
	.globl	_Z9pfc_setupv
	.type	_Z9pfc_setupv, @function
_Z9pfc_setupv:
.LFB2347:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -176(%rbp)
	movl	$0, -172(%rbp)
	movabsq	$8371742459716071267, %rax
	movl	$29816, %edx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	call	_Z11check_cpuidv
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L105
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L105:
	movl	cpu(%rip), %eax
	cmpl	$-1, %eax
	jne	.L106
	call	sched_getcpu@PLT
	movl	%eax, cpu(%rip)
.L106:
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	movl	$16, %edx
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	rep stosq
	movl	cpu(%rip), %eax
	cltq
	movq	%rax, -168(%rbp)
	cmpq	$1023, -168(%rbp)
	ja	.L108
	movq	-168(%rbp), %rax
	shrq	$6, %rax
	leaq	0(,%rax,8), %rdx
	leaq	-160(%rbp), %rcx
	addq	%rcx, %rdx
	movq	(%rdx), %rsi
	movq	-168(%rbp), %rdx
	andl	$63, %edx
	movl	$1, %edi
	movl	%edx, %ecx
	salq	%cl, %rdi
	movq	%rdi, %rdx
	leaq	0(,%rax,8), %rcx
	leaq	-160(%rbp), %rax
	addq	%rcx, %rax
	orq	%rsi, %rdx
	movq	%rdx, (%rax)
.L108:
	leaq	-160(%rbp), %rax
	movq	%rax, %rdx
	movl	$128, %esi
	movl	$0, %edi
	call	sched_setaffinity@PLT
	cmpl	$-1, %eax
	sete	%al
	testb	%al, %al
	je	.L109
	movl	cpu(%rip), %edx
	movq	stderr(%rip), %rax
	leaq	.LC37(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L109:
	movl	-172(%rbp), %edx
	movl	-176(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	_Z22configure_perf_ctrs_FFjj
	call	_Z21parse_counter_configsv
	movl	n_programmable_counters(%rip), %eax
	movslq	%eax, %rdx
	movq	n_pfc_configs(%rip), %rax
	cmpq	%rax, %rdx
	jnb	.L110
	movl	n_programmable_counters(%rip), %edx
	movq	n_pfc_configs(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC38(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L110:
	movl	-172(%rbp), %edx
	movl	-176(%rbp), %eax
	movq	n_pfc_configs(%rip), %rcx
	movl	%ecx, %esi
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$0, %edi
	call	_Z32configure_perf_ctrs_programmableiijj
	movl	$6, %esi
	movl	$8, %edi
	call	calloc@PLT
	movq	%rax, pfc_mem(%rip)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L111
	call	__stack_chk_fail@PLT
.L111:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2347:
	.size	_Z9pfc_setupv, .-_Z9pfc_setupv
	.globl	_Z9pfc_resetv
	.type	_Z9pfc_resetv, @function
_Z9pfc_resetv:
.LFB2348:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L113
.L114:
	movq	pfc_mem(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L113:
	cmpl	$5, -4(%rbp)
	jle	.L114
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2348:
	.size	_Z9pfc_resetv, .-_Z9pfc_resetv
	.section	.rodata
.LC39:
	.string	"a:"
	.text
	.globl	_Z12example_mainiPPc
	.type	_Z12example_mainiPPc, @function
_Z12example_mainiPPc:
.LFB2351:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	call	_Z9pfc_setupv
#APP
# 490 "pfc.cpp" 1
	.intel_syntax noprefix                  
push rax                                
lahf                                    
seto al                                 
push rax                                
push rcx                                
push rdx                                
push r15                                
mov r15,  pfc_mem            
mov qword ptr [r15 + 0], 0              
mov qword ptr [r15 + 8], 0              
mov qword ptr [r15 + 16], 0             
mov qword ptr [r15 + 24], 0             
mov rcx, 0                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
sub [r15 + 0], rdx                      
mov rcx, 1                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
sub [r15 + 8], rdx                      
mov rcx, 2                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
sub [r15 + 16], rdx                     
mov rcx, 3                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
sub [r15 + 24], rdx                     
lfence                                  
pop r15; lfence                         
pop rdx; lfence                         
pop rcx; lfence                         
pop rax; lfence                         
cmp al, -127; lfence                    
sahf; lfence                            
pop rax;                                
lfence                                  
.att_syntax noprefix                    
# 0 "" 2
#NO_APP
	nop
	movl	$1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L116
.L117:
	addl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
.L116:
	cmpl	$999, -4(%rbp)
	jle	.L117
#APP
# 534 "pfc.cpp" 1
	.intel_syntax noprefix                  
lfence                                  
mov r15, pfc_mem            
mov rcx, 0                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
add [r15 + 0], rdx                      
mov rcx, 1                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
add [r15 + 8], rdx                      
mov rcx, 2                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
add [r15 + 16], rdx                     
mov rcx, 3                              
lfence; rdpmc; lfence                   
shl rdx, 32; or rdx, rax                
add [r15 + 24], rdx                     
lfence                                  
.att_syntax noprefix                    
# 0 "" 2
#NO_APP
	nop
	call	_Z9pfc_printv
	leaq	.LC39(%rip), %rax
	movq	%rax, %rsi
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZNSolsEi@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2351:
	.size	_Z12example_mainiPPc, .-_Z12example_mainiPPc
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2871:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L121
	cmpl	$65535, -8(%rbp)
	jne	.L121
	leaq	_ZStL8__ioinit(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rax
	movq	%rax, %rdx
	leaq	_ZStL8__ioinit(%rip), %rax
	movq	%rax, %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L121:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2871:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_pfc_mem, @function
_GLOBAL__sub_I_pfc_mem:
.LFB2872:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2872:
	.size	_GLOBAL__sub_I_pfc_mem, .-_GLOBAL__sub_I_pfc_mem
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_pfc_mem
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
