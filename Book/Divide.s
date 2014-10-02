/**** Divide Program ****/

	.global _start
_start:
	MOV R5, #110			@ Number to print in r6
	MOV R6, #5
	MOV R7, #0
	
_sub:
	SUBS R0, R5, R6

	_exit:
	MOV R7, #1
	SWI 0
	