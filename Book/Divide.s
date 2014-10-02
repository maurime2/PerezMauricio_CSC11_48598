/**** Divide Program ****/

	.global _start
_start:
	MOV R4, #110			@ Number to Divide/ Will hold Remander at the end.
	MOV R5, #5				@ Number to Divide By.
	MOV R3, #0				@ Number to hold Value.
	
_sub:						@ Subtraction Happens HERE.
	SUB R4, R4, R5
	BNE _exit				@ If Negative, go to exit.
	
_add:						@ Increment R6 HERE
	ADD R3, R3, #1			@INCREMENT R7
	BAL _sub
	
_exit:
	@ ADD R0, R4, #0
	ADD R0, R3, #0
	MOV R7, #1
	SWI 0
	