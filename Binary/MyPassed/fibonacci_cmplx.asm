nop
nop	;4

addi r1, r0, 1	;8
addi r2, r0, 2	;12
xor r3, r3, r3	;16
xor r4, r4, r4	;20
addi r5, r0, 50	;24

loop:
	sw 0(r3), r1   ;28
	addi r3, r3, 1 ;32
	jal swap	   ;36
	
	subi r5, r5, 1 ;40
	sne r4, r5, r0 ;44
	add r2, r1, r2 ;48
	bnez r4, loop  ;52
	nop			   ;56
	j end		   ;60


swap:
	nop ;forwording doesn't fit well when a change of context occurs
	nop
	nop
	
	addi r31, r31, 4;76
	xor r1, r1, r2	;64
	xor r2, r2, r1	;68
	xor r1, r1, r2	;72
	
	
	jalr r31 		;88

end:
	nop				;92

;765cc