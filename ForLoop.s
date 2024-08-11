	AREA Forloop, CODE, READONLY
	
	LDR r0, =0
	LDR r1, =0
	
startLoop

	ADD r0, r0, #1
	ADD r1, r1, #2

	CMP r0, #9

	BLE startLoop
		
	END