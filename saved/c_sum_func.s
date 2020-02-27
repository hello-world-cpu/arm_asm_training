.data

.balign 4
	get_val_1: .asciz "Number 1: \n"
.balign 4
	get_val_2: .asciz "Number 2: \n"
.balign 4
	pattern: .asciz "%d"
.balign 4
	n_1: .word 0
.balign 4
	n_2: .word 0
.balign 4
	sum: .word 0
.balign 4
	message: .asciz "%d + %d = %d\n"
.balign 4
	lr_bu: .word 0
.balign 4
	lr_bu2: .word 0

.text

sum_vals:				@custom function
	ldr r2, addr_lr_bu2
	str lr, [r2]

	add r0, r0, r1

	ldr lr, addr_lr_bu2
	ldr lr, [lr]
	bx lr

addr_lr_bu2: .word lr_bu2

.global main

main:
	ldr r1, addr_lr_bu
	str lr, [r1]

	ldr r0, addr_get_val_1
	bl printf

	ldr r0, addr_pattern
	ldr r1, addr_n_1
	bl scanf

	ldr r0, addr_get_val_2
	bl printf

	ldr r0, addr_pattern
	ldr r1, addr_n_2
	bl scanf

	ldr r0, addr_n_1
	ldr r0, [r0]
	ldr r1, addr_n_2
	ldr r1, [r1]
	bl sum_vals

	mov r3, r0			@for the printf inputs in the proper order (r0<-n_1, r1<-n_2, r3<-sum)

	ldr r0, addr_message
	ldr r1, addr_n_1
	ldr r1, [r1]
	ldr r2, addr_n_2
	ldr r2, [r2]
	bl printf
	

	ldr lr, addr_lr_bu
	ldr lr, [lr]
	bx lr


addr_get_val_1: .word get_val_1
addr_get_val_2: .word get_val_2
addr_pattern: .word pattern
addr_n_1: .word n_1
addr_n_2: .word n_2
addr_sum: .word sum
addr_message: .word message
addr_lr_bu: .word lr_bu

.global printf
.global scanf
