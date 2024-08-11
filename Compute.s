	AREA Compute, CODE, READONLY
	
	LDR r0, =200
	
	LDR r5, =3
	
	SUB r3, r5, #5
	
	MOVS r4, r3, LSL #2
	
	SUB r3, r4, r0
	
	SDIV r1, r3, LSR #8
	
	END