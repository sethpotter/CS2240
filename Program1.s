SRAM 	EQU 0x40000000
SRAM1 	EQU 0x40000050
SRAM2	EQU 0x40000100

		AREA Prog1_Potter, CODE, READONLY
		ENTRY

		LDR R7, =SRAM2 ; Result Values
		
		LDR R8, =SRAM ; Positive Array
		LDR R9, =SRAM1 ; Negative Array
		
		ADR R10, table ; Load table address
loop	LDR R0, [R10], #4 ; Load first table entry and offset by 8
		CMP R0, R7 ; Compare to Break Condition -> SRAM2 b/c SRAM2 comes after the table in memory.
		BEQ store ; Break/Return -> == SRAM1
		CMP R0, #0 ; Compare to Zero
		STRGT R0, [R8], #4 ; Store in 0x4 -> 0 >
		STRLT R0, [R9], #4 ; Store in 0x4..50 -> 0 <
		ADDGT R1, R1, #1 ; Positive++
		ADDLT R2, R2, #1 ; Negative++
		B loop ; Loop
		
store	STR R1, [R7], #4
		STR R2, [R7]
		
stop 	B stop

table 	DCD 0x12345678
		DCD 0x23456789
		DCD 0x34567892
		DCD 0x45678921
		DCD 0x56789213
		DCD 0xAB345678
		DCD 0xFF456789
		DCD 0xDC567892
		DCD 0xF1678921
		DCD 0xFFFFFFFF
		DCD 0xA2345678
		DCD 0xB3456789
		DCD 0xC4567892
		DCD 0xD5678921
		DCD 0xE6789213
		DCD 0xAB345678
		DCD 0xFF456789
		DCD 0xDC567892
		DCD 0xF1678921
		DCD 0xFFFFFFFF
			
		END