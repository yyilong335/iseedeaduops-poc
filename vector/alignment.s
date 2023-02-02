	.file	"alignment.cpp"
	.text
	.globl	mysecret1
	.section	.rodata
	.align 8
.LC0:
	.string	"I see NetSpectre by perfcounter"
	.section	.data.rel.local,"aw"
	.align 8
	.type	mysecret1, @object
	.size	mysecret1, 8
mysecret1:
	.quad	.LC0
	.globl	mysecret2
	.section	.rodata
	.align 8
.LC1:
	.string	"Magic Words Squeamish Ossifrage"
	.section	.data.rel.local
	.align 8
	.type	mysecret2, @object
	.size	mysecret2, 8
mysecret2:
	.quad	.LC1
	.globl	array
	.bss
	.align 32
	.type	array, @object
	.size	array, 512
array:
	.zero	512
	.globl	secretbit
	.align 32
	.type	secretbit, @object
	.size	secretbit, 1025
secretbit:
	.zero	1025
	.globl	array1
	.align 32
	.type	array1, @object
	.size	array1, 1048576
array1:
	.zero	1048576
	.globl	v1
	.align 32
	.type	v1, @object
	.size	v1, 32
v1:
	.zero	32
	.globl	v2
	.align 32
	.type	v2, @object
	.size	v2, 32
v2:
	.zero	32
	.globl	v3
	.align 32
	.type	v3, @object
	.size	v3, 32
v3:
	.zero	32
	.globl	v4
	.align 32
	.type	v4, @object
	.size	v4, 32
v4:
	.zero	32
	.globl	v5
	.align 32
	.type	v5, @object
	.size	v5, 32
v5:
	.zero	32
	.globl	length
	.data
	.align 4
	.type	length, @object
	.size	length, 4
length:
	.long	64
	.text
	.globl	_Z10netspectrem
	.type	_Z10netspectrem, @function
_Z10netspectrem:
.LFB4388:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$104, %rsp
	movq	%rdi, -96(%rsp)
	vmovdqa	v2(%rip), %ymm0
	vmovdqa	v1(%rip), %ymm1
	vmovdqa	%ymm1, 40(%rsp)
	vmovdqa	%ymm0, 72(%rsp)
	vmovdqa	40(%rsp), %ymm1
	vmovdqa	72(%rsp), %ymm0
	vpand	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, v3(%rip)
	vmovdqa	v2(%rip), %ymm0
	vmovdqa	v1(%rip), %ymm1
	vmovdqa	%ymm1, -24(%rsp)
	vmovdqa	%ymm0, 8(%rsp)
	vmovdqa	-24(%rsp), %ymm1
	vmovdqa	8(%rsp), %ymm0
	vpand	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, v3(%rip)
	vmovdqa	v2(%rip), %ymm0
	vmovdqa	v1(%rip), %ymm1
	vmovdqa	%ymm1, -88(%rsp)
	vmovdqa	%ymm0, -56(%rsp)
	vmovdqa	-88(%rsp), %ymm1
	vmovdqa	-56(%rsp), %ymm0
	vpand	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, v3(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4388:
	.size	_Z10netspectrem, .-_Z10netspectrem
	.section	.rodata
	.align 8
.LC2:
	.string	"Time1 = %llu\nTime2 = %llu\nTime3 = %llu\n\n"
	.text
	.globl	_Z9alignmentv
	.type	_Z9alignmentv, @function
_Z9alignmentv:
.LFB4389:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$448, %rsp
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	movl	$0, 12(%rsp)
	jmp	.L6
.L7:
	movl	12(%rsp), %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%eax, %edx
	movl	12(%rsp), %eax
	cltq
	movl	%edx, 176(%rsp,%rax,4)
	movl	12(%rsp), %eax
	cltq
	movl	176(%rsp,%rax,4), %eax
	movl	12(%rsp), %edx
	leal	1(%rdx), %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, 12(%rsp)
.L6:
	cmpl	$63, 12(%rsp)
	jle	.L7
	movl	$0, 8(%rsp)
	movl	$0, 64(%rsp)
	movl	$65, 68(%rsp)
	movl	$130, 72(%rsp)
	movl	$195, 76(%rsp)
	movl	$260, 80(%rsp)
	movl	$325, 84(%rsp)
	movl	$390, 88(%rsp)
	movl	$455, 92(%rsp)
	movl	64(%rsp), %eax
	movl	68(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	72(%rsp), %eax
	movl	76(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	80(%rsp), %eax
	movl	84(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	88(%rsp), %eax
	movl	92(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 32(%rsp)
	movl	$1, 36(%rsp)
	movl	$2, 40(%rsp)
	movl	$3, 44(%rsp)
	movl	$4, 48(%rsp)
	movl	$5, 52(%rsp)
	movl	$6, 56(%rsp)
	movl	$7, 60(%rsp)
	movl	32(%rsp), %eax
	movl	36(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	40(%rsp), %eax
	movl	44(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	48(%rsp), %eax
	movl	52(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	56(%rsp), %eax
	movl	60(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v4(%rip)
	movl	$0, 16(%rsp)
	jmp	.L10
.L26:
	leaq	8(%rsp), %rax
	movq	%rax, 136(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	136(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 104(%rsp)
	movl	$0, 20(%rsp)
	jmp	.L12
.L14:
	leaq	array1(%rip), %rax
	movq	%rax, 144(%rsp)
	movq	144(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v2(%rip)
	addl	$1, 20(%rsp)
.L12:
	cmpl	$999, 20(%rsp)
	jle	.L14
	leaq	8(%rsp), %rax
	movq	%rax, 152(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	152(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 112(%rsp)
	movl	$0, 24(%rsp)
	jmp	.L16
.L19:
	movl	$-1, 96(%rsp)
	vpbroadcastd	96(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 24(%rsp)
.L16:
	cmpl	$999, 24(%rsp)
	jle	.L19
	leaq	8(%rsp), %rax
	movq	%rax, 160(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	160(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 120(%rsp)
	movl	$0, 28(%rsp)
	jmp	.L21
.L24:
	movl	$-1, 100(%rsp)
	vpbroadcastd	100(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v4(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v5(%rip)
	addl	$1, 28(%rsp)
.L21:
	cmpl	$999, 28(%rsp)
	jle	.L24
	leaq	8(%rsp), %rax
	movq	%rax, 168(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	168(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 128(%rsp)
	movq	128(%rsp), %rax
	subq	120(%rsp), %rax
	movq	%rax, %rcx
	movq	120(%rsp), %rax
	subq	112(%rsp), %rax
	movq	%rax, %rdx
	movq	112(%rsp), %rax
	subq	104(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 16(%rsp)
.L10:
	cmpl	$4, 16(%rsp)
	jle	.L26
	nop
	movq	440(%rsp), %rax
	subq	%fs:40, %rax
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4389:
	.size	_Z9alignmentv, .-_Z9alignmentv
	.section	.rodata
.LC3:
	.string	"Time1 = %llu\n"
.LC4:
	.string	"Time2 = %llu\n"
.LC5:
	.string	"Time3 = %llu\n"
.LC6:
	.string	"Time4 = %llu\n"
.LC7:
	.string	"Time5 = %llu\n"
.LC8:
	.string	"Time6 = %llu\n"
.LC9:
	.string	"Time7 = %llu\n"
.LC10:
	.string	"Time8 = %llu\n"
	.text
	.globl	_Z10alignment2v
	.type	_Z10alignment2v, @function
_Z10alignment2v:
.LFB4390:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$1696, %rsp
	movq	%fs:40, %rax
	movq	%rax, 1688(%rsp)
	xorl	%eax, %eax
	movl	$0, (%rsp)
	movl	$0, 4(%rsp)
	jmp	.L29
.L30:
	movl	4(%rsp), %eax
	movl	%eax, %edx
	sall	$6, %edx
	addl	%eax, %edx
	movl	4(%rsp), %eax
	cltq
	movl	%edx, 1424(%rsp,%rax,4)
	movl	4(%rsp), %eax
	leal	1(%rax), %ecx
	movl	4(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, 4(%rsp)
.L29:
	cmpl	$63, 4(%rsp)
	jle	.L30
	movl	$0, 124(%rsp)
	movl	$1, 128(%rsp)
	movl	$2, 132(%rsp)
	movl	$3, 136(%rsp)
	movl	$4, 140(%rsp)
	movl	$5, 144(%rsp)
	movl	$6, 148(%rsp)
	movl	$7, 152(%rsp)
	movl	124(%rsp), %eax
	movl	128(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	132(%rsp), %eax
	movl	136(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	140(%rsp), %eax
	movl	144(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	148(%rsp), %eax
	movl	152(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$1, 92(%rsp)
	movl	$2, 96(%rsp)
	movl	$3, 100(%rsp)
	movl	$4, 104(%rsp)
	movl	$5, 108(%rsp)
	movl	$6, 112(%rsp)
	movl	$7, 116(%rsp)
	movl	$8, 120(%rsp)
	movl	92(%rsp), %eax
	movl	96(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	100(%rsp), %eax
	movl	104(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	108(%rsp), %eax
	movl	112(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	116(%rsp), %eax
	movl	120(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v2(%rip)
	movl	$0, 8(%rsp)
	jmp	.L33
.L40:
	movq	%rsp, %rax
	movq	%rax, 464(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	464(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 12(%rsp)
	jmp	.L35
.L38:
	movl	$-1, 156(%rsp)
	vpbroadcastd	156(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 12(%rsp)
.L35:
	cmpl	$999, 12(%rsp)
	jle	.L38
	movq	%rsp, %rax
	movq	%rax, 472(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	472(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 8(%rsp)
.L33:
	cmpl	$4, 8(%rsp)
	jle	.L40
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 480(%rsp)
	vmovdqa	%ymm0, 832(%rsp)
	movq	480(%rsp), %rax
	vmovdqa	832(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$0, 16(%rsp)
	jmp	.L41
.L48:
	movq	%rsp, %rax
	movq	%rax, 488(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	488(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 20(%rsp)
	jmp	.L43
.L46:
	movl	$-1, 160(%rsp)
	vpbroadcastd	160(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 20(%rsp)
.L43:
	cmpl	$999, 20(%rsp)
	jle	.L46
	movq	%rsp, %rax
	movq	%rax, 496(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	496(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 16(%rsp)
.L41:
	cmpl	$4, 16(%rsp)
	jle	.L48
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 504(%rsp)
	vmovdqa	%ymm0, 864(%rsp)
	movq	504(%rsp), %rax
	vmovdqa	864(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$9, array1(%rip)
	movl	$0, 24(%rsp)
	jmp	.L49
.L56:
	movq	%rsp, %rax
	movq	%rax, 512(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	512(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 28(%rsp)
	jmp	.L51
.L54:
	movl	$-1, 164(%rsp)
	vpbroadcastd	164(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 28(%rsp)
.L51:
	cmpl	$999, 28(%rsp)
	jle	.L54
	movq	%rsp, %rax
	movq	%rax, 520(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	520(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 24(%rsp)
.L49:
	cmpl	$4, 24(%rsp)
	jle	.L56
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 536(%rsp)
	vmovdqa	%ymm0, 928(%rsp)
	movq	536(%rsp), %rax
	vmovdqa	928(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 528(%rsp)
	vmovdqa	%ymm0, 896(%rsp)
	movq	528(%rsp), %rax
	vmovdqa	896(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 168(%rsp)
	movl	$5, 172(%rsp)
	movl	$6, 176(%rsp)
	movl	$7, 180(%rsp)
	movl	$8, 184(%rsp)
	movl	$9, 188(%rsp)
	movl	$10, 192(%rsp)
	movl	$221, 196(%rsp)
	movl	168(%rsp), %eax
	movl	172(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm1
	movl	176(%rsp), %eax
	movl	180(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	184(%rsp), %eax
	movl	188(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm2
	movl	192(%rsp), %eax
	movl	196(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 32(%rsp)
	jmp	.L58
.L65:
	movq	%rsp, %rax
	movq	%rax, 544(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	544(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 36(%rsp)
	jmp	.L60
.L63:
	movl	$-1, 200(%rsp)
	vpbroadcastd	200(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	leaq	4+array1(%rip), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 36(%rsp)
.L60:
	cmpl	$999, 36(%rsp)
	jle	.L63
	movq	%rsp, %rax
	movq	%rax, 552(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	552(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 32(%rsp)
.L58:
	cmpl	$4, 32(%rsp)
	jle	.L65
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 568(%rsp)
	vmovdqa	%ymm0, 992(%rsp)
	movq	568(%rsp), %rax
	vmovdqa	992(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 560(%rsp)
	vmovdqa	%ymm0, 960(%rsp)
	movq	560(%rsp), %rax
	vmovdqa	960(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 204(%rsp)
	movl	$5, 208(%rsp)
	movl	$6, 212(%rsp)
	movl	$7, 216(%rsp)
	movl	$8, 220(%rsp)
	movl	$9, 224(%rsp)
	movl	$10, 228(%rsp)
	movl	$11, 232(%rsp)
	movl	204(%rsp), %eax
	movl	208(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm1
	movl	212(%rsp), %eax
	movl	216(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	220(%rsp), %eax
	movl	224(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm2
	movl	228(%rsp), %eax
	movl	232(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 40(%rsp)
	jmp	.L67
.L73:
	movq	%rsp, %rax
	movq	%rax, 576(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	576(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 44(%rsp)
	jmp	.L69
.L71:
	leaq	32+array1(%rip), %rax
	movq	%rax, 584(%rsp)
	movq	584(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 44(%rsp)
.L69:
	cmpl	$999, 44(%rsp)
	jle	.L71
	movq	%rsp, %rax
	movq	%rax, 592(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	592(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 40(%rsp)
.L67:
	cmpl	$4, 40(%rsp)
	jle	.L73
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 608(%rsp)
	vmovdqa	%ymm0, 1056(%rsp)
	movq	608(%rsp), %rax
	vmovdqa	1056(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 600(%rsp)
	vmovdqa	%ymm0, 1024(%rsp)
	movq	600(%rsp), %rax
	vmovdqa	1024(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 236(%rsp)
	movl	$5, 240(%rsp)
	movl	$6, 244(%rsp)
	movl	$7, 248(%rsp)
	movl	$8, 252(%rsp)
	movl	$9, 256(%rsp)
	movl	$10, 260(%rsp)
	movl	$11, 264(%rsp)
	movl	236(%rsp), %eax
	movl	240(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm1
	movl	244(%rsp), %eax
	movl	248(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	252(%rsp), %eax
	movl	256(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm2
	movl	260(%rsp), %eax
	movl	264(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 48(%rsp)
	jmp	.L75
.L81:
	movq	%rsp, %rax
	movq	%rax, 616(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	616(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$0, 52(%rsp)
	jmp	.L77
.L79:
	leaq	array1(%rip), %rax
	movq	%rax, 624(%rsp)
	movq	624(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	addl	$1, 52(%rsp)
.L77:
	cmpl	$999, 52(%rsp)
	jle	.L79
	movq	%rsp, %rax
	movq	%rax, 632(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	632(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 48(%rsp)
.L75:
	cmpl	$4, 48(%rsp)
	jle	.L81
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 648(%rsp)
	vmovdqa	%ymm0, 1120(%rsp)
	movq	648(%rsp), %rax
	vmovdqa	1120(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 640(%rsp)
	vmovdqa	%ymm0, 1088(%rsp)
	movq	640(%rsp), %rax
	vmovdqa	1088(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movq	$0, 440(%rsp)
	movl	$4, 268(%rsp)
	movl	$5, 272(%rsp)
	movl	$6, 276(%rsp)
	movl	$7, 280(%rsp)
	movl	$8, 284(%rsp)
	movl	$9, 288(%rsp)
	movl	$10, 292(%rsp)
	movl	$11, 296(%rsp)
	movl	268(%rsp), %eax
	movl	272(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	276(%rsp), %eax
	movl	280(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	284(%rsp), %eax
	movl	288(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	292(%rsp), %eax
	movl	296(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 56(%rsp)
	jmp	.L83
.L91:
	movq	$0, 440(%rsp)
	movl	$0, 60(%rsp)
	jmp	.L84
.L90:
	movl	$0, 64(%rsp)
	jmp	.L85
.L86:
	movl	64(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 656(%rsp)
	movq	656(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 64(%rsp)
.L85:
	cmpl	$63, 64(%rsp)
	jle	.L86
	movq	%rsp, %rax
	movq	%rax, 664(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	664(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	leaq	array1(%rip), %rax
	movq	%rax, 680(%rsp)
	movq	680(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 672(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	672(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	addq	%rax, 440(%rsp)
	addl	$1, 60(%rsp)
.L84:
	cmpl	$9, 60(%rsp)
	jle	.L90
	movq	440(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 56(%rsp)
.L83:
	cmpl	$4, 56(%rsp)
	jle	.L91
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 696(%rsp)
	vmovdqa	%ymm0, 1184(%rsp)
	movq	696(%rsp), %rax
	vmovdqa	1184(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 688(%rsp)
	vmovdqa	%ymm0, 1152(%rsp)
	movq	688(%rsp), %rax
	vmovdqa	1152(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 300(%rsp)
	movl	$5, 304(%rsp)
	movl	$6, 308(%rsp)
	movl	$7, 312(%rsp)
	movl	$8, 316(%rsp)
	movl	$9, 320(%rsp)
	movl	$10, 324(%rsp)
	movl	$11, 328(%rsp)
	movl	300(%rsp), %eax
	movl	304(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	308(%rsp), %eax
	movl	312(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	316(%rsp), %eax
	movl	320(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	324(%rsp), %eax
	movl	328(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 68(%rsp)
	jmp	.L93
.L101:
	movq	$0, 440(%rsp)
	movl	$0, 72(%rsp)
	jmp	.L94
.L100:
	movl	$0, 76(%rsp)
	jmp	.L95
.L96:
	movl	76(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, 704(%rsp)
	movq	704(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 76(%rsp)
.L95:
	cmpl	$63, 76(%rsp)
	jle	.L96
	movq	%rsp, %rax
	movq	%rax, 712(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	712(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	leaq	32+array1(%rip), %rax
	movq	%rax, 728(%rsp)
	movq	728(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 720(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	720(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	addq	%rax, 440(%rsp)
	addl	$1, 72(%rsp)
.L94:
	cmpl	$9, 72(%rsp)
	jle	.L100
	movq	440(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 68(%rsp)
.L93:
	cmpl	$4, 68(%rsp)
	jle	.L101
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 744(%rsp)
	vmovdqa	%ymm0, 1248(%rsp)
	movq	744(%rsp), %rax
	vmovdqa	1248(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 736(%rsp)
	vmovdqa	%ymm0, 1216(%rsp)
	movq	736(%rsp), %rax
	vmovdqa	1216(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 332(%rsp)
	movl	$5, 336(%rsp)
	movl	$6, 340(%rsp)
	movl	$7, 344(%rsp)
	movl	$8, 348(%rsp)
	movl	$9, 352(%rsp)
	movl	$10, 356(%rsp)
	movl	$11, 360(%rsp)
	movl	332(%rsp), %eax
	movl	336(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm1
	movl	340(%rsp), %eax
	movl	344(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	348(%rsp), %eax
	movl	352(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm2
	movl	356(%rsp), %eax
	movl	360(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 80(%rsp)
	jmp	.L103
.L108:
	movq	%rsp, %rax
	movq	%rax, 752(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	752(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$-1, 364(%rsp)
	vpbroadcastd	364(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 760(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	760(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 80(%rsp)
.L103:
	cmpl	$4, 80(%rsp)
	jle	.L108
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 776(%rsp)
	vmovdqa	%ymm0, 1312(%rsp)
	movq	776(%rsp), %rax
	vmovdqa	1312(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 768(%rsp)
	vmovdqa	%ymm0, 1280(%rsp)
	movq	768(%rsp), %rax
	vmovdqa	1280(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 368(%rsp)
	movl	$5, 372(%rsp)
	movl	$6, 376(%rsp)
	movl	$7, 380(%rsp)
	movl	$8, 384(%rsp)
	movl	$9, 388(%rsp)
	movl	$10, 392(%rsp)
	movl	$221, 396(%rsp)
	movl	368(%rsp), %eax
	movl	372(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm1
	movl	376(%rsp), %eax
	movl	380(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	384(%rsp), %eax
	movl	388(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm2
	movl	392(%rsp), %eax
	movl	396(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 84(%rsp)
	jmp	.L110
.L115:
	movq	%rsp, %rax
	movq	%rax, 784(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	784(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$-1, 400(%rsp)
	vpbroadcastd	400(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	leaq	4+array1(%rip), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 792(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	792(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 84(%rsp)
.L110:
	cmpl	$4, 84(%rsp)
	jle	.L115
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 808(%rsp)
	vmovdqa	%ymm0, 1376(%rsp)
	movq	808(%rsp), %rax
	vmovdqa	1376(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 800(%rsp)
	vmovdqa	%ymm0, 1344(%rsp)
	movq	800(%rsp), %rax
	vmovdqa	1344(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 404(%rsp)
	movl	$5, 408(%rsp)
	movl	$6, 412(%rsp)
	movl	$7, 416(%rsp)
	movl	$8, 420(%rsp)
	movl	$9, 424(%rsp)
	movl	$10, 428(%rsp)
	movl	$2221, 432(%rsp)
	movl	404(%rsp), %eax
	movl	408(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm1
	movl	412(%rsp), %eax
	movl	416(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	420(%rsp), %eax
	movl	424(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm2
	movl	428(%rsp), %eax
	movl	432(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 88(%rsp)
	jmp	.L117
.L122:
	movq	%rsp, %rax
	movq	%rax, 816(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	816(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 448(%rsp)
	movl	$-1, 436(%rsp)
	vpbroadcastd	436(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	leaq	4+array1(%rip), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 824(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	824(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 456(%rsp)
	movq	456(%rsp), %rax
	subq	448(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 88(%rsp)
.L117:
	cmpl	$4, 88(%rsp)
	jle	.L122
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	1688(%rsp), %rax
	subq	%fs:40, %rax
	je	.L123
	call	__stack_chk_fail@PLT
.L123:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4390:
	.size	_Z10alignment2v, .-_Z10alignment2v
	.section	.rodata
.LC11:
	.string	"Time1 = %llu\n\n"
.LC12:
	.string	"Time2 = %llu\n\n"
.LC13:
	.string	"Time3 = %llu\n\n"
.LC14:
	.string	"Time4 = %llu\n\n"
.LC15:
	.string	"Time5 = %llu\n\n"
.LC16:
	.string	"Time6 = %llu\n\n"
.LC17:
	.string	"Time7 = %llu\n\n"
	.text
	.globl	_Z10alignment3v
	.type	_Z10alignment3v, @function
_Z10alignment3v:
.LFB4391:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$896, %rsp
	movq	%fs:40, %rax
	movq	%rax, 888(%rsp)
	xorl	%eax, %eax
	call	_Z9pfc_resetv@PLT
	movl	$0, 4(%rsp)
	movl	$0, 8(%rsp)
	jmp	.L125
.L126:
	movl	8(%rsp), %eax
	leal	1(%rax), %ecx
	movl	8(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, 8(%rsp)
.L125:
	cmpl	$4095, 8(%rsp)
	jle	.L126
	movl	$0, 12(%rsp)
	jmp	.L127
.L128:
	movl	12(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 400(%rsp)
	movq	400(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 12(%rsp)
.L127:
	cmpl	$4095, 12(%rsp)
	jle	.L128
	movl	$4, 124(%rsp)
	movl	$5, 128(%rsp)
	movl	$6, 132(%rsp)
	movl	$7, 136(%rsp)
	movl	$8, 140(%rsp)
	movl	$9, 144(%rsp)
	movl	$10, 148(%rsp)
	movl	$11, 152(%rsp)
	movl	124(%rsp), %eax
	movl	128(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	132(%rsp), %eax
	movl	136(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	140(%rsp), %eax
	movl	144(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	148(%rsp), %eax
	movl	152(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 16(%rsp)
	jmp	.L130
.L139:
#APP
# 274 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 275 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 20(%rsp)
	jmp	.L131
.L138:
	movl	$0, 24(%rsp)
	jmp	.L132
.L133:
	movl	24(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 408(%rsp)
	movq	408(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 24(%rsp)
.L132:
	cmpl	$4095, 24(%rsp)
	jle	.L133
	leaq	4(%rsp), %rax
	movq	%rax, 416(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	416(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 156(%rsp)
	vpbroadcastd	156(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 424(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	424(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 20(%rsp)
.L131:
	cmpl	$9999, 20(%rsp)
	jle	.L138
#APP
# 286 "alignment.cpp" 1
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
# 287 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 16(%rsp)
.L130:
	cmpl	$0, 16(%rsp)
	jle	.L139
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 28(%rsp)
	jmp	.L140
.L141:
	movl	28(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 432(%rsp)
	movq	432(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 28(%rsp)
.L140:
	cmpl	$4095, 28(%rsp)
	jle	.L141
	movl	$12, 160(%rsp)
	movl	$13, 164(%rsp)
	movl	$14, 168(%rsp)
	movl	$15, 172(%rsp)
	movl	$16, 176(%rsp)
	movl	$17, 180(%rsp)
	movl	$18, 184(%rsp)
	movl	$19, 188(%rsp)
	movl	160(%rsp), %eax
	movl	164(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	168(%rsp), %eax
	movl	172(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	176(%rsp), %eax
	movl	180(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	184(%rsp), %eax
	movl	188(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 32(%rsp)
	jmp	.L143
.L152:
#APP
# 301 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 302 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 36(%rsp)
	jmp	.L144
.L151:
	movl	$0, 40(%rsp)
	jmp	.L145
.L146:
	movl	40(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 440(%rsp)
	movq	440(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 40(%rsp)
.L145:
	cmpl	$4095, 40(%rsp)
	jle	.L146
	leaq	4(%rsp), %rax
	movq	%rax, 448(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	448(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 192(%rsp)
	vpbroadcastd	192(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 456(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	456(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 36(%rsp)
.L144:
	cmpl	$9999, 36(%rsp)
	jle	.L151
#APP
# 313 "alignment.cpp" 1
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
# 314 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 32(%rsp)
.L143:
	cmpl	$0, 32(%rsp)
	jle	.L152
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 44(%rsp)
	jmp	.L153
.L154:
	movl	44(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 464(%rsp)
	movq	464(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 44(%rsp)
.L153:
	cmpl	$4095, 44(%rsp)
	jle	.L154
	movl	$12, 196(%rsp)
	movl	$14, 200(%rsp)
	movl	$16, 204(%rsp)
	movl	$18, 208(%rsp)
	movl	$20, 212(%rsp)
	movl	$22, 216(%rsp)
	movl	$24, 220(%rsp)
	movl	$26, 224(%rsp)
	movl	196(%rsp), %eax
	movl	200(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm1
	movl	204(%rsp), %eax
	movl	208(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	212(%rsp), %eax
	movl	216(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm2
	movl	220(%rsp), %eax
	movl	224(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 48(%rsp)
	jmp	.L156
.L165:
#APP
# 328 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 329 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 52(%rsp)
	jmp	.L157
.L164:
	movl	$0, 56(%rsp)
	jmp	.L158
.L159:
	movl	56(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 472(%rsp)
	movq	472(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 56(%rsp)
.L158:
	cmpl	$4095, 56(%rsp)
	jle	.L159
	leaq	4(%rsp), %rax
	movq	%rax, 480(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	480(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 228(%rsp)
	vpbroadcastd	228(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 488(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	488(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 52(%rsp)
.L157:
	cmpl	$9999, 52(%rsp)
	jle	.L164
#APP
# 340 "alignment.cpp" 1
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
# 341 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 48(%rsp)
.L156:
	cmpl	$0, 48(%rsp)
	jle	.L165
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 60(%rsp)
	jmp	.L166
.L167:
	movl	60(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 496(%rsp)
	movq	496(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 60(%rsp)
.L166:
	cmpl	$4095, 60(%rsp)
	jle	.L167
	movl	$12, 232(%rsp)
	movl	$14, 236(%rsp)
	movl	$16, 240(%rsp)
	movl	$18, 244(%rsp)
	movl	$32, 248(%rsp)
	movl	$34, 252(%rsp)
	movl	$48, 256(%rsp)
	movl	$50, 260(%rsp)
	movl	232(%rsp), %eax
	movl	236(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm1
	movl	240(%rsp), %eax
	movl	244(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	248(%rsp), %eax
	movl	252(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm2
	movl	256(%rsp), %eax
	movl	260(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 64(%rsp)
	jmp	.L169
.L178:
#APP
# 355 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 356 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 68(%rsp)
	jmp	.L170
.L177:
	movl	$0, 72(%rsp)
	jmp	.L171
.L172:
	movl	72(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 504(%rsp)
	movq	504(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 72(%rsp)
.L171:
	cmpl	$4095, 72(%rsp)
	jle	.L172
	leaq	4(%rsp), %rax
	movq	%rax, 512(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	512(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 264(%rsp)
	vpbroadcastd	264(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 520(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	520(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 68(%rsp)
.L170:
	cmpl	$9999, 68(%rsp)
	jle	.L177
#APP
# 367 "alignment.cpp" 1
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
# 368 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 64(%rsp)
.L169:
	cmpl	$0, 64(%rsp)
	jle	.L178
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 76(%rsp)
	jmp	.L179
.L180:
	movl	76(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 528(%rsp)
	movq	528(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 76(%rsp)
.L179:
	cmpl	$4095, 76(%rsp)
	jle	.L180
	movl	$1, 268(%rsp)
	movl	$16, 272(%rsp)
	movl	$33, 276(%rsp)
	movl	$55, 280(%rsp)
	movl	$77, 284(%rsp)
	movl	$88, 288(%rsp)
	movl	$99, 292(%rsp)
	movl	$112, 296(%rsp)
	movl	268(%rsp), %eax
	movl	272(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm1
	movl	276(%rsp), %eax
	movl	280(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	284(%rsp), %eax
	movl	288(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm2
	movl	292(%rsp), %eax
	movl	296(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 80(%rsp)
	jmp	.L182
.L191:
#APP
# 382 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 383 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 84(%rsp)
	jmp	.L183
.L190:
	movl	$0, 88(%rsp)
	jmp	.L184
.L185:
	movl	88(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 536(%rsp)
	movq	536(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 88(%rsp)
.L184:
	cmpl	$4095, 88(%rsp)
	jle	.L185
	leaq	4(%rsp), %rax
	movq	%rax, 544(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	544(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 300(%rsp)
	vpbroadcastd	300(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 552(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	552(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 84(%rsp)
.L183:
	cmpl	$9999, 84(%rsp)
	jle	.L190
#APP
# 394 "alignment.cpp" 1
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
# 395 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 80(%rsp)
.L182:
	cmpl	$0, 80(%rsp)
	jle	.L191
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 92(%rsp)
	jmp	.L192
.L193:
	movl	92(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 560(%rsp)
	movq	560(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 92(%rsp)
.L192:
	cmpl	$4095, 92(%rsp)
	jle	.L193
	movl	$1, 304(%rsp)
	movl	$16, 308(%rsp)
	movl	$33, 312(%rsp)
	movl	$55, 316(%rsp)
	movl	$77, 320(%rsp)
	movl	$88, 324(%rsp)
	movl	$99, 328(%rsp)
	movl	$1112, 332(%rsp)
	movl	304(%rsp), %eax
	movl	308(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	312(%rsp), %eax
	movl	316(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	320(%rsp), %eax
	movl	324(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	328(%rsp), %eax
	movl	332(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 96(%rsp)
	jmp	.L195
.L204:
#APP
# 413 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 414 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 100(%rsp)
	jmp	.L196
.L203:
	movl	$0, 104(%rsp)
	jmp	.L197
.L198:
	movl	104(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 568(%rsp)
	movq	568(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 104(%rsp)
.L197:
	cmpl	$4095, 104(%rsp)
	jle	.L198
	leaq	4(%rsp), %rax
	movq	%rax, 576(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	576(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 336(%rsp)
	vpbroadcastd	336(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 584(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	584(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 100(%rsp)
.L196:
	cmpl	$9999, 100(%rsp)
	jle	.L203
#APP
# 425 "alignment.cpp" 1
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
# 426 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 96(%rsp)
.L195:
	cmpl	$0, 96(%rsp)
	jle	.L204
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	movl	$0, 108(%rsp)
	jmp	.L205
.L206:
	movl	108(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 592(%rsp)
	movq	592(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 108(%rsp)
.L205:
	cmpl	$4095, 108(%rsp)
	jle	.L206
	movl	$1, 340(%rsp)
	movl	$160, 344(%rsp)
	movl	$333, 348(%rsp)
	movl	$555, 352(%rsp)
	movl	$777, 356(%rsp)
	movl	$888, 360(%rsp)
	movl	$999, 364(%rsp)
	movl	$4112, 368(%rsp)
	movl	340(%rsp), %eax
	movl	344(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	348(%rsp), %eax
	movl	352(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	356(%rsp), %eax
	movl	360(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	364(%rsp), %eax
	movl	368(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 376(%rsp)
	call	_Z9pfc_resetv@PLT
	movl	$0, 112(%rsp)
	jmp	.L208
.L217:
#APP
# 440 "alignment.cpp" 1
	CPUID
# 0 "" 2
# 441 "alignment.cpp" 1
	        .intel_syntax noprefix                  	
        push rax                                	
        lahf                                    	
        seto al                                 	
        push rax                                	
        push rcx                                	
        push rdx                                	
        push r15                                	
        mov r15,  pfc_mem            	
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
	movl	$0, 116(%rsp)
	jmp	.L209
.L216:
	movl	$0, 120(%rsp)
	jmp	.L210
.L211:
	movl	120(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 600(%rsp)
	movq	600(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$16, 120(%rsp)
.L210:
	cmpl	$4095, 120(%rsp)
	jle	.L211
	leaq	4(%rsp), %rax
	movq	%rax, 608(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	608(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 384(%rsp)
	movl	$-1, 372(%rsp)
	vpbroadcastd	372(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	leaq	4(%rsp), %rax
	movq	%rax, 616(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	616(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 392(%rsp)
	movq	392(%rsp), %rax
	subq	384(%rsp), %rax
	addq	%rax, 376(%rsp)
	addl	$1, 116(%rsp)
.L209:
	cmpl	$9999, 116(%rsp)
	jle	.L216
#APP
# 452 "alignment.cpp" 1
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
# 453 "alignment.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 112(%rsp)
.L208:
	cmpl	$0, 112(%rsp)
	jle	.L217
	movq	376(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	_Z9pfc_printv@PLT
	nop
	movq	888(%rsp), %rax
	subq	%fs:40, %rax
	je	.L218
	call	__stack_chk_fail@PLT
.L218:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4391:
	.size	_Z10alignment3v, .-_Z10alignment3v
	.section	.rodata
.LC18:
	.string	"locating..."
	.text
	.globl	_Z10alignment4v
	.type	_Z10alignment4v, @function
_Z10alignment4v:
.LFB4392:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$640, %rsp
	movq	%fs:40, %rax
	movq	%rax, 632(%rsp)
	xorl	%eax, %eax
	movl	$1, 52(%rsp)
	movl	$2, 56(%rsp)
	movl	$3, 60(%rsp)
	movl	$4, 64(%rsp)
	movl	$5, 68(%rsp)
	movl	$6, 72(%rsp)
	movl	$7, 76(%rsp)
	movl	$8, 80(%rsp)
	movl	52(%rsp), %eax
	movl	56(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm1
	movl	60(%rsp), %eax
	movl	64(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	68(%rsp), %eax
	movl	72(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm2
	movl	76(%rsp), %eax
	movl	80(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v2(%rip)
	movl	$0, (%rsp)
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 152(%rsp)
	vmovdqa	%ymm0, 256(%rsp)
	movq	152(%rsp), %rax
	vmovdqa	256(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 144(%rsp)
	vmovdqa	%ymm0, 224(%rsp)
	movq	144(%rsp), %rax
	vmovdqa	224(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 20(%rsp)
	movl	$5, 24(%rsp)
	movl	$6, 28(%rsp)
	movl	$7, 32(%rsp)
	movl	$8, 36(%rsp)
	movl	$9, 40(%rsp)
	movl	$10, 44(%rsp)
	movl	$2221, 48(%rsp)
	movl	20(%rsp), %eax
	movl	24(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm1
	movl	28(%rsp), %eax
	movl	32(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	36(%rsp), %eax
	movl	40(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm2
	movl	44(%rsp), %eax
	movl	48(%rsp), %edx
	vmovd	%edx, %xmm5
	vpinsrd	$1, %eax, %xmm5, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movl	$0, 4(%rsp)
	jmp	.L222
.L227:
	movq	%rsp, %rax
	movq	%rax, 160(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	160(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 128(%rsp)
	movl	$-1, 84(%rsp)
	vpbroadcastd	84(%rsp), %ymm0
	vmovdqa	%ymm0, %ymm2
	vmovdqa	v1(%rip), %ymm0
	vmovdqa	%ymm0, %ymm1
	vpxor	%xmm0, %xmm0, %xmm0
	leaq	array1(%rip), %rax
	vpgatherdd	%ymm2, (%rax,%ymm1,1), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 168(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	168(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 136(%rsp)
	movq	136(%rsp), %rax
	subq	128(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 4(%rsp)
.L222:
	cmpl	$4, 4(%rsp)
	jle	.L227
	movl	$10, %edi
	call	putchar@PLT
	vmovdqa	v2(%rip), %ymm0
	leaq	array1(%rip), %rax
	movq	%rax, 184(%rsp)
	vmovdqa	%ymm0, 320(%rsp)
	movq	184(%rsp), %rax
	vmovdqa	320(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	vmovdqa	v2(%rip), %ymm0
	leaq	32+array1(%rip), %rax
	movq	%rax, 176(%rsp)
	vmovdqa	%ymm0, 288(%rsp)
	movq	176(%rsp), %rax
	vmovdqa	288(%rsp), %ymm0
	vmovdqa	%ymm0, (%rax)
	nop
	movl	$4, 88(%rsp)
	movl	$5, 92(%rsp)
	movl	$6, 96(%rsp)
	movl	$7, 100(%rsp)
	movl	$8, 104(%rsp)
	movl	$9, 108(%rsp)
	movl	$10, 112(%rsp)
	movl	$11, 116(%rsp)
	movl	88(%rsp), %eax
	movl	92(%rsp), %edx
	vmovd	%edx, %xmm6
	vpinsrd	$1, %eax, %xmm6, %xmm1
	movl	96(%rsp), %eax
	movl	100(%rsp), %edx
	vmovd	%edx, %xmm7
	vpinsrd	$1, %eax, %xmm7, %xmm0
	vpunpcklqdq	%xmm1, %xmm0, %xmm1
	movl	104(%rsp), %eax
	movl	108(%rsp), %edx
	vmovd	%edx, %xmm3
	vpinsrd	$1, %eax, %xmm3, %xmm2
	movl	112(%rsp), %eax
	movl	116(%rsp), %edx
	vmovd	%edx, %xmm4
	vpinsrd	$1, %eax, %xmm4, %xmm0
	vpunpcklqdq	%xmm2, %xmm0, %xmm0
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	$0, 120(%rsp)
	movl	$0, 8(%rsp)
	jmp	.L229
.L237:
	movq	$0, 120(%rsp)
	movl	$0, 12(%rsp)
	jmp	.L230
.L236:
	movl	$0, 16(%rsp)
	jmp	.L231
.L232:
	movl	16(%rsp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	array1(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, 192(%rsp)
	movq	192(%rsp), %rax
	clflush	(%rax)
	nop
	addl	$1, 16(%rsp)
.L231:
	cmpl	$63, 16(%rsp)
	jle	.L232
	movq	%rsp, %rax
	movq	%rax, 200(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	200(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 128(%rsp)
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	8+array1(%rip), %rax
	movq	%rax, 216(%rsp)
	movq	216(%rsp), %rax
	vmovdqa	(%rax), %ymm0
	vmovdqa	%ymm0, v3(%rip)
	movq	%rsp, %rax
	movq	%rax, 208(%rsp)
	rdtscp
	movl	%ecx, %esi
	movq	208(%rsp), %rcx
	movl	%esi, (%rcx)
	salq	$32, %rdx
	orq	%rdx, %rax
	nop
	movq	%rax, 136(%rsp)
	movq	136(%rsp), %rax
	subq	128(%rsp), %rax
	addq	%rax, 120(%rsp)
	addl	$1, 12(%rsp)
.L230:
	cmpl	$9999, 12(%rsp)
	jle	.L236
	movq	120(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, 8(%rsp)
.L229:
	cmpl	$0, 8(%rsp)
	jle	.L237
	movl	$10, %edi
	call	putchar@PLT
	nop
	movq	632(%rsp), %rax
	subq	%fs:40, %rax
	je	.L238
	call	__stack_chk_fail@PLT
.L238:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4392:
	.size	_Z10alignment4v, .-_Z10alignment4v
	.globl	_Z10run_victimm
	.type	_Z10run_victimm, @function
_Z10run_victimm:
.LFB4393:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	call	_Z9pfc_resetv@PLT
	call	_Z10alignment4v
	nop
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4393:
	.size	_Z10run_victimm, .-_Z10run_victimm
	.section	.rodata
.LC19:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4394:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, 184(%rsp)
	xorl	%eax, %eax
	call	_Z9pfc_setupv@PLT
	movq	mysecret1(%rip), %rax
	movq	%rax, 56(%rsp)
	movq	56(%rsp), %rax
	vmovdqu	(%rax), %ymm0
	vmovdqa	%ymm0, v1(%rip)
	movq	mysecret2(%rip), %rax
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	vmovdqu	(%rax), %ymm0
	vmovdqa	%ymm0, v2(%rip)
	vmovdqa	v1(%rip), %ymm0
	leaq	96(%rsp), %rax
	movq	%rax, 40(%rsp)
	vmovdqa	%ymm0, 64(%rsp)
	vmovdqa	64(%rsp), %ymm0
	movq	40(%rsp), %rax
	vmovdqu	%ymm0, (%rax)
	nop
	movl	$0, 24(%rsp)
	jmp	.L243
.L244:
	movl	24(%rsp), %eax
	cltq
	movzbl	96(%rsp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	addl	$1, 24(%rsp)
.L243:
	cmpl	$31, 24(%rsp)
	jle	.L244
	movl	$10, %edi
	call	putchar@PLT
	movl	$10, %edi
	call	putchar@PLT
	leaq	array1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	4+array1(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, 28(%rsp)
	jmp	.L245
.L246:
	call	rand@PLT
	andl	$1, %eax
	movl	%eax, %ecx
	movl	28(%rsp), %eax
	cltq
	leaq	secretbit(%rip), %rdx
	movb	%cl, (%rax,%rdx)
	addl	$1, 28(%rsp)
.L245:
	cmpl	$999, 28(%rsp)
	jle	.L246
	movb	$1, secretbit(%rip)
	leaq	secretbit(%rip), %rax
	leaq	array(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	32(%rsp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rax, %rdi
	call	_Z10run_victimm
	movl	$0, %eax
	movq	184(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L248
	call	__stack_chk_fail@PLT
.L248:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4394:
	.size	main, .-main
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
