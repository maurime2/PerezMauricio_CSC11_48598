/**** Divide Program ****/

	.global _start
_start:
	MOV R2, #110			@ Number to print in r6
	MOV R3, #5
	EORS R0, R3, #0xFFFFFFFF
	ADDS R0, R0, #1

	_exit:
	MOV R7, #1
	SWI 0
	