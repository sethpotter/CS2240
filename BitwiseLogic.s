	AREA BitwiseLogic, CODE, READONLY
	
	LDR r6, =0x0000FFFF
	LDR r7, =0x00AB00B
	
	ORR r0, r6, r7
	
	LDR r6, =261
	LDR r7, =0xFFF00FFF
	
	AND r1, r6, r7
	
	LDR r6, =0x30303030
	LDR r7, =0x00FF00FF
	
	EOR r2, r6, r7
	
	LDR r6, =-1
	LSL r6, r6, #3
	
	LDR r7, =-1
	LDR r8, =0xFFFF0000
	
	AND r7, r7, r8
	
	ORR r3, r6, r7

	MVN r4, #-1
	
	LDR r6, =261
	LDR r7, =64
	MVN r7, r7
	
	AND r5, r6, r7
	
	END