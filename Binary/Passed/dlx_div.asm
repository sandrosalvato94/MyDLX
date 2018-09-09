nop
nop
addi r1, r0, 81				;8
addi r2, r0, 9				;12
xor r3, r3, r3				;16
divide:	
	slt r5, r1, r2			;20
	addi r3, r3, 1			;24
	bnez r5, finish			;28
	sub r1, r1, r2			;32
	nop						;36
	j divide				;40
finish:
add r4, r0, r1				;44
nop

;76 cc instead of 84 cc