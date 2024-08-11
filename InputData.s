	AREA InputData, CODE, READONLY
		
		LDR R0, =0x40000000
		
		LDR R3, =0x59 ; Y
		LDR R4, =0x4E ; N
		LDR R5, =0xA ; User
		
		CMP R5, R3 ; User to Answer 1
		BEQ valid
		CMP R5, R4 ; User to Answer 2
		BEQ valid
		
		ADR R1, invalid
		B loop
		
valid	ADR R1, match
		
loop	LDR R2, [R1], #1 ; Loop	
		STRB R2, [R0], #1
		AND R2, R2, #0x000000FF ; Getting just 1 byte of information (instead of 32bits)
		CMP R2, #0
		BNE loop

stop	B stop

match	DCB "MATCH", 0
invalid	DCB "INVALID", 0

		END