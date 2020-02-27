.data

.balign 4
sentence: .asciz "hello world how are you today"

.balign 4
lr_bu: .word 0

.text
.global main

main:
	ldr r0, addr_lr_bu
	str lr, [r0]

	ldr r0, addr_sentence
	mov r2, #0

_loop:
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq end
	cmp r1, #32
	beq spa
	bic r1, r1, #0x00000020
	strb r1, [r0, r2]
spa:	add r2, r2, #1
	b _loop

end:
	bl printf
	ldr lr, addr_lr_bu
	ldr lr, [lr]
	bx lr


addr_sentence: .word sentence
addr_lr_bu: .word lr_bu

.global printf
