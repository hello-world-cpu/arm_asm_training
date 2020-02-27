.data
.balign 4
question: .asciz "What is your favorite number ?\n"

.balign 4
message: .asciz "%d is a great number\n"

.balign 4
pattern: .asciz "%d"

.balign 4
number: .word 0

.balign 4
lr_bu: .word 0

.text

.global main
@.func main

main:
	ldr r1, addr_lr_bu	@TC: we are inside a function, so called by another program. To return to that other program, this latter (by a bl or similar instruction) stored the pc in lr.
	str lr, [r1]		@the thing is we haveto modify lr in this function (calls to scanf and printf). So we have to backup the original lr in memory.

	ldr r0, addr_question
	bl printf

	ldr r0, addr_pattern
	ldr r1, addr_number
	bl scanf

	ldr r0, addr_message
	ldr r1, addr_number
	ldr r1, [r1]
	bl printf

	ldr lr, addr_lr_bu
	ldr lr, [lr]
	bx lr			@finish the program


addr_question: .word question
addr_message: .word message
addr_pattern: .word pattern
addr_number: .word number
addr_lr_bu: .word lr_bu

.global printf
.global scanf
