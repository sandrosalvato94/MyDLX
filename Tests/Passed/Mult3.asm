addi r1, r0, 6
addi r2, r0, 7
lw r4, 100(r1)
mult r1, r4
mflo r3
j fine
mult r1, r2

fine:
j fine

;9cc