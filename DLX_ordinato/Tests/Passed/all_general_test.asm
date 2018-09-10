l1: 
add r9,r20,r10	;r9 = 0
addi r1,r2,#-5	;r1 = -5
and r9,r3,r10	;r9 = 0
andi r20,r9,#8	;r20 = 0
lw r19, 63(r8)	;r19 = 0
nop
ori r5, r3, #342;r5 = 342
sge r1,r2,r10	;r1 = 1
sgei r9,r20,#6	;r9 = 0
sle r13,r2,r4	;r13 = 1
slei r1,r3,#-4	;r1 = 0
sll r1,r2,r3	;r1 = 0
slli r4,r1,#5	;r4 = 0
sne r1,r2,r3	;r1 = 0
snei r3,r5,#4	;r3 = 1
srl r5,r7,r8	;r5 = 0
srli r7,r5,#2	;r7 = 0
sub r6,r12,r15  ;r6 = 0
subi r7,r9,#-30 ;r7 = 30
xor r6,r12,r15	;r6 = 0
xori r6,r12,#1	;r6 = 1
addu r5,r3,r4	;r5 = 1
addui r1,r5,#250;r1 = 251
lb r1,3-4(r2)
lbu r3,5-4(r4)
lhi r1,#-40
lhu r2,32(r6)
mult r2,r4
mflo r5
multu r2, r3
mfhi r5
sb 41(r3), r2
seq r13,r1,r4
seqi r29,r20,#1
sgeu r9,r20,r10
sgeui r7,r8,#23
sgt r1,r2,r3
sgti r4,r1,#15
sgtu r5,r6,r3
sgtui r15,r3,#8
slt r5,r7,r8
slti r9,r10,#30
sltu r17,r13,r14
sltui r5,r7,#13
sra r1,r2,r3
srai r25,r26,#10
subu r13,r2,r4
subui r5,r18,#4
or r5, r3, r4
sleu r13,r2,r9
sleui r22,r30,#30	;FDEMW
j l1				; FD
