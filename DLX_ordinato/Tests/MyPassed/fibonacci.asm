nop
nop

addi r1, r0, 1
addi r2, r0, 1
xor r3, r3, r3
addi r5, r0, 50

loop:
	sw 0(r3), r1
	addi r3, r3, 1
	subi r5, r5, 1
	add r4, r1, r2
	add r1, r0, r2
	add r2, r0, r4
	bnez r5, loop

;351cc instead of 404