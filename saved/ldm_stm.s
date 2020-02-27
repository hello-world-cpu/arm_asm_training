.global _start

_start:
	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	mov r4, #5
	str r0, [sp, #-4]!
	str r1, [sp, #-4]!
	stmdb sp!, {r2, r3, r4}
	ldr r5, [sp], #4
	ldr r6, [sp], #4
	ldmia sp!, {r7, r8, r9}

end:
	mov r7, #1
	swi 0
