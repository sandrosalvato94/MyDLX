
addi r1, r0, 6
addi r2, r0, 7
mult r1, r2
mflo r3
addi r3, r3, 2
shift:

srli r3, r3, 1
nop 
bnez r3, shift
fine:
j fine
