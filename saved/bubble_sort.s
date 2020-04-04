.data

list:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

.balign 4
	pattern: .asciz "%d"
.balign 4
	enter_num: .asciz "Enter a number: "
.balign 4
	n: .word 0
.balign 4
	bu_lr: .word 0
.balign 4
	sent: .asciz "Sorted list:\n"
.balign 4
	pr_n: .asciz "list[%d]=%d\n"

.text
.global main

main:
	ldr r1, addr_bu_lr
	str lr, [r1]

	ldr r5, addr_list
	mov r7, #0	@counter
loop:
	ldr r0, addr_enter_num
	bl printf

	ldr r0, addr_pattern
	ldr r1, addr_n
	bl scanf

	ldr r1, addr_n
	ldr r1, [r1]
	str r1, [r5], #4

	add r7, r7, #1
	cmp r7, #8
	beq bubble
	b loop

bubble:
	mov r7, #0	@init counter of for
	ldr r0, addr_list
sort:
	add r1, r0, #4
	ldr r2, [r0]
	ldr r3, [r1]
	cmp r2, r3
	bgt swap
	mov r0, r1
	cmp r7, #6
	beq psl
	add r7, r7, #1
	b sort
swap:
	str r2, [r1]
	str r3, [r0]
	b bubble

psl:	@print sorted list
	ldr r0, addr_sent
	bl printf
	ldr r5, addr_list
	ldr r0, addr_pr_n
	mov r7, #0	@counter
p_val:	@print value
	ldr r0, addr_pr_n
	mov r1, r7
	ldr r2, [r5], #4
	bl printf
	cmp r7, #7
	beq end
	add r7, r7, #1
	b p_val

end:
	ldr lr, addr_bu_lr
	ldr lr, [lr]
	bx lr


addr_list: .word list
addr_pattern: .word pattern
addr_enter_num: .word enter_num
addr_n: .word n
addr_bu_lr: .word bu_lr
addr_sent: .word sent
addr_pr_n: .word pr_n

.global scanf
.global printf
