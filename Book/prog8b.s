/**** Convert number to binary form printing ****/

	.global _start
_start:
	MOV R6, #251			@ Number to print in r6
	MOV R10, #1				@ set up mask
	MOV R9, R10, LSL #31
	LDR R1, = string		@ Point R1 to string

_bits:
	TST R6, R9				@ TST no, mask
	BEQ _print0
	MOV R8, R6				@ MOV preserve, no
	MOV R0, #49				@ ASCII '1'
	STR R0, [R1]			@ store 1 in string
	BL _write				@ write to screen
	MOV R6, R8				@ MOV no , preserve
	BAL _noprint1

_print0;
	MOV R8, R6				@ MOV preserve, no
	MOV R0, #48				@ ACII '0'
