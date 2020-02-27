.data

.balign 4
	v1: .word 0
.balign 4
	v2: .word 0 

.text
.global _start

_start:
	ldr r1, addr_v1
	mov r3, #15
	str r3, [r1]
	ldr r2, addr_v2
	mov r3, #16
	str r3, [r2]
	ldr r1, [r1]
	ldr r2, [r2]
	add r0, r1, r2

end:
	mov r7, #1
	swi 0

addr_v1: .word v1
addr_v2: .word v2
