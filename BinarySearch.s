		AREA BinarySearch, CODE, READONLY
		ENTRY
	
		; Load R12 with Destination Address
		LDR R12, =0x40000000 ; Dest Adr
		
		; Prep work
		LDR R0, =0 ; Starting Index ; Low
		LDR R1, =6 ; Size -1 ; High
		
		; Load the key to find.
		ADR R2, keyToFind6
		LDR R2, [R2]
		
		; Load R11 with Table Address
		ADR R11, table2 ; Address of the Table
		
		; While Loop
loop	ADD R5, R0, R1 ; Add (low + high) indexies
		LSR R5, #1 ; Divide by 2 (Middle index)
		MOV R6, R5 ; Copy the Index to a new register, so we don't shift it by accident
		MOV R7, R5 ; second index
		LSL R6, #4 ; Multiple our number by 16 to get the location in memory for key (Each word is 16 bytes)
		LDR R4, [R11, R6] ; Load into R4 our Key. Get address of Table then preform immediate offset of R5 which is Index * 16 bytes
		CMP R4, R2 ; Compare our found key to keyToFind1
		SUBGT R1, R5, #1 ; high = mid - 1 (Set if Greater Than)
		ADDLT R0, R5, #1 ; low = mid + 1 (Set if less than)
		BEQ done ; Return Mid;
		
		CMP R0, R1 ; Compare Low to High
		BLE loop ; Branch Less than Equal

		LDR R5, =-1	
done	STR R5, [R12]
	
stop B stop

; Indexs are stored right after the label.
; Labels are mem addresses?


table1 	DCD 4 ; Index 0
		DCB "Milkshake"
		DCD 13 ; Index 1
		DCB "Hamburgers"
		DCD 25 ; Index 2
		DCB "French Fries"
		DCD 32 ; Index 3
		DCB "Garden Salad"
		DCD 47 ; Index 4
		DCB "Cheeseburger"
		DCD 53 ; Index 5
		DCB "Apple Pie"
		
keyToFind1 DCD 32
keyToFind2 DCD 22
keyToFind3 DCD 4
	
table2	DCD 0x004 ; 32 bits
		DCB "PEPPERONI" ; a bunch of bits
		ALIGN 16
		DCD 0x012
		DCB "CHEESE"
		ALIGN 16
		DCD 0x018
		DCB "BLACK OLIVES"
		DCD 0x022
		DCB "GREEN PEPPER"
		DCD 0x024
		DCB "EXTRA SAUCE"
		DCD 0x038
		DCB "TOMATOS"
		ALIGN 16
		DCD 0x200
		DCB "PINEAPPLE"
		
keyToFind4 DCD 0x12
keyToFind5 DCD 0x200
keyToFind6 DCD 0x8

	END