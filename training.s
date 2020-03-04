.data

.balign 4
	sent1: .asciz "type:\ng for green\nr for red\ny for yellow\n"
.balign 4
	gr: .asciz "green"
.balign 4
	re: .asciz "red"
.balign 4
	ye: .asciz "yellow"
.balign 4
	sent2: .asciz "%s is a nice color\n"
.balign 4
	patternc: .asciz "%c"
.balign 4
	choice: .word 0
.balign 4
	lr_bu: .word 0

.text
.global main

main:
	ldr r1, addr_lr_bu
	str lr, [r1]

	ldr r0, addr_sent1
	bl printf
	
	ldr r0, addr_patternc
	ldr r1, addr_choice
	bl scanf

	ldr r0, addr_choice
	ldr r0, [r0]

	cmp r0, #'g'
	beq green
	cmp r0, #'r'
	beq red
	cmp r0, #'y'
	beq yellow

green:
	ldr r1, addr_gr
	b pr
red:
	ldr r1, addr_re
	b pr
yellow:
	ldr r1, addr_ye
	b pr		@(useless)

pr:
	ldr r0, addr_sent2
	bl printf


end:	ldr lr, addr_lr_bu
	ldr lr, [lr]
	bx lr


addr_sent1: .word sent1
addr_gr: .word gr
addr_re: .word re
addr_ye: .word ye
addr_sent2: .word sent2
addr_patternc: .word patternc
addr_choice: .word choice
addr_lr_bu: .word lr_bu

.global printf
.global scanf
