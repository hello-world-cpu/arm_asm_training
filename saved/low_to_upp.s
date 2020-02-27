.data

low_char: .ascii "hello "
newline: .ascii " "

.text

.global _start

_start:	
	mov r7, #3
	mov r0, #0
	mov r2, #1
	ldr r1, =low_char
	swi 0
_write:
	mov r7, #4
	mov r2, #1
	ldr r1, =low_char
	ldr r0, [r1]
	eor r0, r0, #0b00100000
	str r0, [r1]
	mov r0, #1
	swi 0

	ldr r1, =newline
	swi 0

end:
	mov r7, #1
	swi 0


@labels needed to access data:
