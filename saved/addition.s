.data

.balign 4
	v1: .word 15
.balign 4
	v2: .word 30 

.text
.global _start

_start:
	ldr r1, addr_v1
	ldr r1, [r1]
	ldr r2, addr_v2
	ldr r2, [r2]
	add r0, r1, r2

end:
	mov r7, #1
	swi 0

addr_v1: .word v1
addr_v2: .word v2
