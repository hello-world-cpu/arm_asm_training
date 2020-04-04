.data
primes:
	.word 2
	.word 3
	.word 56789
	.word 7
.balign 4
	bu_lr: .word 0
.balign 4
	message: .asciz "primes[2] = %d\n"

.text
.global main

main:
	ldr r1, addr_bu_lr
	str lr, [r1]

	ldr r0, addr_message
	ldr r1, addr_primes
	ldr r1, [r1, #8]
	bl printf

end:
	ldr lr, addr_bu_lr
	ldr lr, [lr]
	bx lr

addr_primes: .word primes
addr_bu_lr: .word bu_lr
addr_message: .word message

.global printf
