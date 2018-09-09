nop
nop

addi r1, r0, 1	;A = 1
addi r2, r1, 1	;B = 2
add  r3, r1, r2 ;C = 3
sub  r4, r3, r1 ;D = 2

addi r5, r4, 1	;E = 3
addi r6, r5, 1	;F = 4
add  r7, r6, r6 ;G = 8
sub  r8, r6, r7 ;H = -4


xor r26, r26, r26
xor r27, r27, r27
xor r28, r28, r28
xor r29, r29, r29
xor r30, r30, r30

addi r26, r26, 1
add r27, r27, r1
add r28, r28, r5
add r29, r29, r2
add r30, r30, r7

jal label

add r27, r27, r1
add r28, r28, r6
add r29, r29, r2
add r30, r30, r8

jal label

add r27, r27, r3
add r28, r28, r5
add r29, r29, r4
add r30, r30, r7

jal label

add r27, r27, r3
add r28, r28, r6
add r29, r29, r4
add r30, r30, r8

jal label
nop
j end

label:
	nop
	nop
	mult r27, r28
	mflo r25
	mult r29, r30
	mflo r24
	addi r31, r31, 4
	add r23, r25, r24
	sw 0(r26), r23
	xor r27, r27, r27
	xor r28, r28, r28
	xor r29, r29, r29
	xor r30, r30, r30
	addi r26, r26, 1
	jalr r31
	
end:
	nop

;109cc