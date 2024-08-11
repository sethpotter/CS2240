	AREA Compares, CODE, READONLY

		LDR R0, =0x40000000
		LDR R1, ='Y' ;answer1
		LDR R2, ='Y' ;user
		
		ADR R3, match
		LDR R3, [R3]
		ADR R4, invalid
		LDR R4, [R4]
		
		STR R3, [R0]
		
		CMP R1, R2
		BNE skip
		STR R3, [R0]
		B stop
		
skip	STR R4, [R0]
		
match	DCB "MATCH"
invalid DCB "INVALID"

stop	B stop

		END