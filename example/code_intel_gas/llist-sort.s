.intel_syntax noprefix
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 32
	mov [rbp - 24], rdi
	mov [rbp - 32], rsi
	mov edi, 24
	call malloc@PLT
	mov [rbp - 8], rax
	cmp QWORD PTR [rbp - 8], 0
	jne .L2
	lea rax, [rip + .LC0]
	mov rdi, rax
	call perror@PLT
	mov edi, 1
	call exit@PLT
.L2:
	mov rax, [rbp - 8]
	mov QWORD PTR [rax + 16], 0
	mov rax, [rbp - 32]
	mov rdi, rax
	call malloc@PLT
	mov rdx, rax
	mov rax, [rbp - 8]
	mov [rax], rdx
	mov rax, [rbp - 8]
	mov rax, [rax]
	test rax, rax
	jne .L3
	mov rax, [rbp - 8]
	mov rdi, rax
	call free@PLT
	lea rax, [rip + .LC1]
	mov rdi, rax
	call perror@PLT
	mov edi, 1
	call exit@PLT
.L3:
	mov rax, [rbp - 8]
	mov rax, [rax]
	mov rdx, [rbp - 32]
	mov rcx, [rbp - 24]
	mov rsi, rcx
	mov rdi, rax
	call memcpy@PLT
	mov rax, [rbp - 8]
	mov rdx, [rbp - 32]
	mov [rax + 8], rdx
	mov rax, [rbp - 8]
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 48
	mov [rbp - 24], rdi
	mov [rbp - 32], rsi
	mov [rbp - 40], rdx
	mov rax, [rbp - 24]
	mov [rbp - 8], rax
	jmp .L6
.L7:
	mov rax, [rbp - 8]
	mov rax, [rax]
	add rax, 16
	mov [rbp - 8], rax
.L6:
	mov rax, [rbp - 8]
	mov rax, [rax]
	test rax, rax
	jne .L7
	mov rdx, [rbp - 40]
	mov rax, [rbp - 32]
	mov rsi, rdx
	mov rdi, rax
	call init_node
	mov rdx, [rbp - 8]
	mov [rdx], rax
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 64
	mov [rbp - 56], rdi
	mov [rbp - 64], rsi
	cmp QWORD PTR [rbp - 56], 0
	je .L15
	mov QWORD PTR [rbp - 32], 0
	mov QWORD PTR [rbp - 24], 0
.L14:
	mov BYTE PTR [rbp - 33], 0
	mov rax, [rbp - 56]
	mov [rbp - 32], rax
	jmp .L11
.L13:
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov rdx, [rax]
	mov rax, [rbp - 32]
	mov rax, [rax]
	mov rcx, [rbp - 64]
	mov rsi, rdx
	mov rdi, rax
	call rcx
	test eax, eax
	jle .L12
	mov rax, [rbp - 32]
	mov rax, [rax]
	mov [rbp - 16], rax
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov rdx, [rax]
	mov rax, [rbp - 32]
	mov [rax], rdx
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov rdx, [rbp - 16]
	mov [rax], rdx
	mov rax, [rbp - 32]
	mov rax, [rax + 8]
	mov [rbp - 8], rax
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov rdx, [rax + 8]
	mov rax, [rbp - 32]
	mov [rax + 8], rdx
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov rdx, [rbp - 8]
	mov [rax + 8], rdx
	mov BYTE PTR [rbp - 33], 1
.L12:
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	mov [rbp - 32], rax
.L11:
	mov rax, [rbp - 32]
	mov rax, [rax + 16]
	cmp [rbp - 24], rax
	jne .L13
	mov rax, [rbp - 32]
	mov [rbp - 24], rax
	cmp BYTE PTR [rbp - 33], 0
	jne .L14
	jmp .L8
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 32
	mov [rbp - 24], rdi
	mov [rbp - 28], esi
	mov rax, [rbp - 24]
	mov [rbp - 16], rax
	jmp .L17
.L20:
	mov rax, [rbp - 16]
	mov rax, [rax]
	mov rax, [rax]
	mov eax, [rax]
	cmp [rbp - 28], eax
	jne .L18
	mov rax, [rbp - 16]
	mov rax, [rax]
	mov [rbp - 8], rax
	mov rax, [rbp - 8]
	mov rdx, [rax + 16]
	mov rax, [rbp - 16]
	mov [rax], rdx
	mov rax, [rbp - 8]
	mov rax, [rax]
	mov rdi, rax
	call free@PLT
	mov rax, [rbp - 8]
	mov rdi, rax
	call free@PLT
	mov eax, 1
	jmp .L19
.L18:
	mov rax, [rbp - 16]
	mov rax, [rax]
	add rax, 16
	mov [rbp - 16], rax
.L17:
	mov rax, [rbp - 16]
	mov rax, [rax]
	test rax, rax
	jne .L20
	mov eax, 0
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 64
	mov [rbp - 40], rdi
	mov [rbp - 48], rsi
	mov [rbp - 56], rdx
	mov [rbp - 60], ecx
	mov rax, [rbp - 40]
	mov [rbp - 16], rax
	mov DWORD PTR [rbp - 20], 0
	jmp .L22
.L24:
	mov rax, [rbp - 16]
	mov rax, [rax]
	add rax, 16
	mov [rbp - 16], rax
	add DWORD PTR [rbp - 20], 1
.L22:
	mov rax, [rbp - 16]
	mov rax, [rax]
	test rax, rax
	je .L23
	mov eax, [rbp - 20]
	cmp eax, [rbp - 60]
	jl .L24
.L23:
	mov eax, [rbp - 20]
	cmp eax, [rbp - 60]
	jne .L25
	mov rdx, [rbp - 56]
	mov rax, [rbp - 48]
	mov rsi, rdx
	mov rdi, rax
	call init_node
	mov [rbp - 8], rax
	mov rax, [rbp - 16]
	mov rdx, [rax]
	mov rax, [rbp - 8]
	mov [rax + 16], rdx
	mov rax, [rbp - 16]
	mov rdx, [rbp - 8]
	mov [rax], rdx
	mov eax, 1
	jmp .L26
.L25:
	mov eax, 0
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 48
	mov [rbp - 40], rdi
	mov [rbp - 44], esi
	mov rax, [rbp - 40]
	mov [rbp - 16], rax
	mov DWORD PTR [rbp - 20], 0
	jmp .L28
.L31:
	mov eax, [rbp - 20]
	cmp eax, [rbp - 44]
	jne .L29
	mov rax, [rbp - 16]
	mov rax, [rax]
	mov [rbp - 8], rax
	mov rax, [rbp - 8]
	mov rdx, [rax + 16]
	mov rax, [rbp - 16]
	mov [rax], rdx
	mov rax, [rbp - 8]
	mov rax, [rax]
	mov rdi, rax
	call free@PLT
	mov rax, [rbp - 8]
	mov rdi, rax
	call free@PLT
	mov eax, 1
	jmp .L30
.L29:
	mov rax, [rbp - 16]
	mov rax, [rax]
	add rax, 16
	mov [rbp - 16], rax
	add DWORD PTR [rbp - 20], 1
.L28:
	mov rax, [rbp - 16]
	mov rax, [rax]
	test rax, rax
	jne .L31
	mov eax, 0
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 32
	mov [rbp - 24], rdi
	jmp .L33
.L34:
	mov rax, [rbp - 24]
	mov rax, [rax + 16]
	mov [rbp - 8], rax
	mov rax, [rbp - 24]
	mov rax, [rax]
	mov rdi, rax
	call free@PLT
	mov rax, [rbp - 24]
	mov rdi, rax
	call free@PLT
	mov rax, [rbp - 8]
	mov [rbp - 24], rax
.L33:
	cmp QWORD PTR [rbp - 24], 0
	jne .L34
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 16
	mov [rbp - 8], rdi
	jmp .L36
.L37:
	mov rax, [rbp - 8]
	mov rax, [rax]
	mov eax, [rax]
	lea rdx, [rip + .LC2]
	mov esi, eax
	mov rdi, rdx
	mov eax, 0
	call printf@PLT
	mov rax, [rbp - 8]
	mov rax, [rax + 16]
	mov [rbp - 8], rax
.L36:
	cmp QWORD PTR [rbp - 8], 0
	jne .L37
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	mov rax, [rbp - 8]
	mov edx, [rax]
	mov rax, [rbp - 16]
	mov eax, [rax]
	cmp edx, eax
	setg al
	movzx eax, al
	pop rbp
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
	push rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov rbp, rsp
	.cfi_def_cfa_register 6
	sub rsp, 48
	mov rax, fs:[40]
	mov [rbp - 8], rax
	xor eax, eax
	mov QWORD PTR [rbp - 40], 0
	mov DWORD PTR [rbp - 32], 10
	mov DWORD PTR [rbp - 28], 20
	mov DWORD PTR [rbp - 24], 30
	mov DWORD PTR [rbp - 44], 0
	jmp .L41
.L42:
	lea rax, [rbp - 32]
	mov edx, [rbp - 44]
	movsxd rdx, edx
	sal rdx, 2
	lea rcx, [rax + rdx]
	lea rax, [rbp - 40]
	mov edx, 4
	mov rsi, rcx
	mov rdi, rax
	call add_item
	add DWORD PTR [rbp - 44], 1
.L41:
	cmp DWORD PTR [rbp - 44], 2
	jle .L42
	lea rax, [rip + .LC3]
	mov rdi, rax
	call puts@PLT
	mov rax, [rbp - 40]
	mov rdi, rax
	call print_list
	lea rsi, [rbp - 32]
	lea rax, [rbp - 40]
	mov ecx, 1
	mov edx, 4
	mov rdi, rax
	call insert_at_index
	test al, al
	je .L43
	lea rax, [rip + .LC4]
	mov rdi, rax
	call puts@PLT
	mov rax, [rbp - 40]
	mov rdi, rax
	call print_list
.L43:
	lea rax, [rbp - 40]
	mov esi, 20
	mov rdi, rax
	call remove_item
	test al, al
	je .L44
	lea rax, [rip + .LC5]
	mov rdi, rax
	call puts@PLT
.L44:
	lea rax, [rbp - 40]
	mov esi, 1
	mov rdi, rax
	call remove_index
	test al, al
	je .L45
	lea rax, [rip + .LC6]
	mov rdi, rax
	call puts@PLT
.L45:
	lea rax, [rip + .LC7]
	mov rdi, rax
	call puts@PLT
	mov rax, [rbp - 40]
	mov rdi, rax
	call print_list
	mov DWORD PTR [rbp - 20], 10
	mov DWORD PTR [rbp - 16], -1
	mov DWORD PTR [rbp - 12], 5
	lea rcx, [rbp - 20]
	lea rax, [rbp - 40]
	mov edx, 4
	mov rsi, rcx
	mov rdi, rax
	call add_item
	lea rax, [rbp - 20]
	lea rcx, [rax + 4]
	lea rax, [rbp - 40]
	mov edx, 4
	mov rsi, rcx
	mov rdi, rax
	call add_item
	lea rax, [rbp - 20]
	lea rcx, [rax + 8]
	lea rax, [rbp - 40]
	mov edx, 4
	mov rsi, rcx
	mov rdi, rax
	call add_item
	mov rax, [rbp - 40]
	lea rdx, [rip + compare_integer]
	mov rsi, rdx
	mov rdi, rax
	call sort_list
	lea rax, [rip + .LC8]
	mov rdi, rax
	call puts@PLT
	mov rax, [rbp - 40]
	mov rdi, rax
	call print_list
	mov rax, [rbp - 40]
	mov rdi, rax
	call free_list
	mov eax, 0
	mov rdx, [rbp - 8]
	sub rdx, fs:[40]
	je .L47
	call __stack_chk_fail@PLT
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
