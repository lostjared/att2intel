	.file	"llist-sort.c"
	.text
	.section	.rodata
.LC0:
	.string	"Error allocate"
.LC1:
	.string	"data allocation failed"
	.text
	.globl	init_node
	.type	init_node, @function
init_node:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	init_node, .-init_node
	.globl	add_item
	.type	add_item, @function
add_item:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L6
.L7:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, -8(%rbp)
.L6:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_node
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	add_item, .-add_item
	.globl	sort_list
	.type	sort_list, @function
sort_list:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L15
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
.L14:
	movb	$0, -33(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L11
.L13:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-64(%rbp), %rcx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
	testl	%eax, %eax
	jle	.L12
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movb	$1, -33(%rbp)
.L12:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
.L11:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L13
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	cmpb	$0, -33(%rbp)
	jne	.L14
	jmp	.L8
.L15:
	nop
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	sort_list, .-sort_list
	.globl	remove_item
	.type	remove_item, @function
remove_item:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L17
.L20:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	cmpl	%eax, -28(%rbp)
	jne	.L18
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
	jmp	.L19
.L18:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
.L17:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L20
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	remove_item, .-remove_item
	.globl	insert_at_index
	.type	insert_at_index, @function
insert_at_index:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L22
.L24:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
.L22:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L23
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L24
.L23:
	movl	-20(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jne	.L25
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_node
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	$1, %eax
	jmp	.L26
.L25:
	movl	$0, %eax
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	insert_at_index, .-insert_at_index
	.globl	remove_index
	.type	remove_index, @function
remove_index:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L28
.L31:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jne	.L29
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
	jmp	.L30
.L29:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
.L28:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L31
	movl	$0, %eax
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	remove_index, .-remove_index
	.globl	free_list
	.type	free_list, @function
free_list:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	jmp	.L33
.L34:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L33:
	cmpq	$0, -24(%rbp)
	jne	.L34
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	free_list, .-free_list
	.section	.rodata
.LC2:
	.string	"%d\n"
	.text
	.globl	print_list
	.type	print_list, @function
print_list:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	jmp	.L36
.L37:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	leaq	.LC2(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L36:
	cmpq	$0, -8(%rbp)
	jne	.L37
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	print_list, .-print_list
	.globl	compare_integer
	.type	compare_integer, @function
compare_integer:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	setg	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	compare_integer, .-compare_integer
	.section	.rodata
.LC3:
	.string	"before remove: "
.LC4:
	.string	"inserted 10 at index 1"
.LC5:
	.string	"removed 20"
.LC6:
	.string	"removed 10"
.LC7:
	.string	"after remove:"
.LC8:
	.string	"after sort: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -40(%rbp)
	movl	$10, -32(%rbp)
	movl	$20, -28(%rbp)
	movl	$30, -24(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L41
.L42:
	leaq	-32(%rbp), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rcx
	leaq	-40(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	add_item
	addl	$1, -44(%rbp)
.L41:
	cmpl	$2, -44(%rbp)
	jle	.L42
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	print_list
	leaq	-32(%rbp), %rsi
	leaq	-40(%rbp), %rax
	movl	$1, %ecx
	movl	$4, %edx
	movq	%rax, %rdi
	call	insert_at_index
	testb	%al, %al
	je	.L43
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	print_list
.L43:
	leaq	-40(%rbp), %rax
	movl	$20, %esi
	movq	%rax, %rdi
	call	remove_item
	testb	%al, %al
	je	.L44
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L44:
	leaq	-40(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	remove_index
	testb	%al, %al
	je	.L45
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L45:
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	print_list
	movl	$10, -20(%rbp)
	movl	$-1, -16(%rbp)
	movl	$5, -12(%rbp)
	leaq	-20(%rbp), %rcx
	leaq	-40(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	add_item
	leaq	-20(%rbp), %rax
	leaq	4(%rax), %rcx
	leaq	-40(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	add_item
	leaq	-20(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-40(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	add_item
	movq	-40(%rbp), %rax
	leaq	compare_integer(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sort_list
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	print_list
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free_list
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L47
	call	__stack_chk_fail@PLT
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
