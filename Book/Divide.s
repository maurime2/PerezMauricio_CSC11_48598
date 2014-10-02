/**** Divide Program ****/

	.global _start
_start:
	MOV R4, #111			@ Number to Divide/ Will hold Remander at the end.
	MOV R5, #5				@ Number to Divide By.
	MOV R3, #0				@ Number to hold Value.
	
_sub:						@ Subtraction Happens HERE.
	SUBS R1, R1, R5
	BMI _exit				@ If Negative, go to exit.
							@ BAL _sub @ TEST - SHOULD LOOP TILL NEG VALUE ACHIVED
_add:						@ Increment R6 HERE
	ADD R3, R3, #1			@INCREMENT R7
	BAL _sub
	
_exit:
	ADD R0, R1, R5
	@ ADD R0, R3, #0
	MOV R7, #1
	SWI 0
	