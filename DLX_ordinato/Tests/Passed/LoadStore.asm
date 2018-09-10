nop
nop
myloop:

addi r1, r1, 4
lw r2, 4(r1)
sw 12(r1), r2       ; should forward
lh r3, 8(r1)
nop
addi r4, r3, 15     
addi r7, r0, myloop ;move label into r7
addi r2, r0, 4
nop
jalr r7        	    ;jump

;13 cc