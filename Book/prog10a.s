/**** Convert number to binary form printing ****/

	.global _start
_start:
	MOV R6, #15				@ Number to print in R6
	MOV R10, #1				@ set up mask
	MOV R9, R10, LSL #31	@ Left Shift #1 31 times. x8000
	LDR R1, = string		@ Point R1 to string

_bits:
	TST R6, R9				@ TST no, mask
	MOVEQ R0, #48			@ ASCII '0'
	MOVNE R0, #49			@ ASCII '1'
	STR R0, [R1]			@ store 1 in string
	MOV R8, R6				@ MOV PRESERVE, NO
	BL _write				@ write to screen
	MOV R6, R8				@ MOV no , preserve
	
	MOVS R9, R9, LSR #1		@ SHUFFLE MASK BITS
	BNE _bits
	

_exit:
	MOV R7, #1
	SWI 0

_write:
	MOV R0, #1
	MOV R2, #1
	MOV R7, #4
	SWI 0
	BX LR

.data
string:
	.ascii "  "
