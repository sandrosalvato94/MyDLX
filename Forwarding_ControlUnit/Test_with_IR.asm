add r1, r2, r3		FDEMW
add r3, r2, r2		 FDEMW
lw r2, 4(r1)	      FDEMW ; forwordind di r1 MEM/WB -> ID/EX
sw 12(r1), r2          FDEMW; forwordind di r2 MEM/WB -> EX/MEM, (possibile problema in simulazione)
lh r3, 8(r1)            FDEMW
addi r4, r13, 15         FDEMW ; possibile problema a 60 ns (F di addi)
jalr r4                   FsDEMW; stall e forwordind di r4 EX/MEM -> IF/ID
nop                         FDEMW
add r3, r7, r9               FDEMW 
sw 12(r1), r3                 FDEMW; ; forwordind di r3 MEM/WB -> EX/MEM
lw r2, 4(r1)                   FDEMW
jalr r2                         FssDEMW ; doppio stallo e forwordind di r2 MEM/WB -> IF/ID

00430820
00421820
8c220004
ac22000c
84230008"
21a4000f
4c800000
54000000
00e91820
ac23000c
8c220004
4c400000

