	AREA shiftbits, CODE, READONLY
	
	LDR r8, =1
	
	LSL r0, r8, #15
	LSL r1, r8, #14
	LSL r2, r8, #13
	LSL r3, r8, #12
	LSL r4, r8, #11
	LSL r5, r8, #10
	LSL r6, r8, #9
	LSL r7, r8, #8
	
	END