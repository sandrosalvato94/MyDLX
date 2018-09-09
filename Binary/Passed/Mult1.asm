addi r1, r0, 6
addi r2, r0, 7
lw r4, 100(r1)
mult r1, r2
mflo r3
mult r1, r3
mflo r5
sw 100(r3), r5
addi r3, r3, 2  ;40
shift:

srli r3, r3, 1 ;44
nop			   ;48
bnez r3, shift ;52

fine:
j fine

;30 cc