
addi r1, r0, 100	;FDEMW			5
xor r2, r2, r2		; FDEMW			1

ciclo:
lw r3, 0(r2)		;  FDEMW		1
addi r3, r3, 10		;   FsDEMW		2
sw 100(r2), r3		;     FDEMW		1
subi r1, r1, 1		;      FDEMW	1
addi r2, r2, 4		;       FDEMW	1
bnez r1, ciclo		;        FDEMW	1
					;		  F sbaglia la prima e l'ultima volta 2*2
					;		   
addi r4, r0, 65535 	;		   FDEMW 1
ori r5, r4, 100000	;			FDEMW	1
add r6, r4, r5		;			 FDEMW	1

end:								1
j end				

;711 cc instead of 806