/**** Divide Program ****/

	.global _start
_start:
	MOV R4, #110			@ Number to Divide/ Will hold Remander at the end.
	MOV R5, #5				@ Number to Divide By.
	MOV R6, #0				@ Number to hold Value.
	
_sub:						@ Subtraction Happens HERE.
	SUBS R0, R4, R5
	BNE _exit				@ If Negative, go to exit.
	
_add;						@ Increment R6 HERE
	ADD R6, R6, #1			@INCREMENT R7
	TST R6, R6
	BEQ _sub
	
_exit:
	ADD R0, R4, R5
	@ MOV R0, R6
	MOV R7, #1
	SWI 0
	