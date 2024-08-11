	AREA Palindrome, CODE, READONLY
		ENTRY

		LDR R12, =0x40001000 ; Reverse Address (The address we use in memory to reverse strings)
		ADR R11, table ; Address of the Table
		LDR R10, =0x40000000 ; Results Address (Store results here)
		
		LDR R7, =26 ; Number of Words to Process. 26 in table
		
runPal	BL isPal
		ADD R6, R6, #1
		CMP R6, R7
		BNE runPal
		
stop 	B stop ; "Run to Cursor" on this line.


isPal	LDRB R0, [R11], #1 ; Load a byte from table
		CMP R0, #0
		ADDNE R1, R1, #1 ; R1 = Size of word
		BNE isPal
		
		MOV R2, R1 ; Size 2
		SUB R11, R11, R2
		SUB R11, R11, #1
		SUB R1, R1, #1
		
reverse	LDRB R0, [R11], #1
		STRB R0, [R12, R1] ; Store the reversed word at 0x4
		SUB R1, R1, #1
		CMP R1, #-1
		BNE reverse
		
		LDR R3, =1
		MOV R4, R2 ; Reset Size
		SUB R11, R11, R2
		
chkPal	LDRB R0, [R11], #1
		LDRB R1, [R12], #1

		CMP R0, R1
		LDRNE R3, =-1 ; If words are not equal
		SUB R4, R4, #1
		CMP R4, #0
		BNE chkPal
		
		CMP R3, #0
		ADDGT R4, R4, #1
		
		; Reset
		ADD R11, R11, #1
		SUB R12, R12, R2
		
		LDR R1, =0
		
		STRH R3, [R10], #2
		
		BX LR;

table	DCB "one", 0
		DCB "semester", 0
		DCB "kayak", 0
		DCB "cat", 0
		DCB "level", 0
		DCB "mom", 0
		DCB "boat", 0
		DCB "noon", 0
		DCB "racecar", 0
		DCB "radar", 0
		DCB "reader", 0
		DCB "robber", 0
		DCB "food", 0
		DCB "refer", 0
		DCB "referee", 0
		DCB "repaper", 0
		DCB "rabbit", 0
		DCB "rotor", 0
		DCB "sagas", 0
		DCB "saga", 0
		DCB "solos", 0
		DCB "my", 0
		DCB "stats", 0
		DCB "a", 0
		DCB "tenet", 0
		DCB "wow", 0

		END