/**** Divide Program: Mauricio S. Perez ****/
/**** DUE DATE: OCTOBER 1st 2014        ****/
/**** CSC11 - 48598 					****/
/**** Program 1: Divide With Flags

	.global _start
_start:
	MOV R4, #111			@ Number to divide / Will hold remainder.
	MOV R5, #5				@ Number to divide by.
	MOV R3, #0				@ Number to hold times divided by value.
	
_sub:						@ Subtraction Happens HERE.
	SUBS R4, R4, R5
	BMI _exit				@ If Negative, branch to exit.

_add:						@ Increment R3 HERE
	ADD R3, R3, #1			@ Will Hold value of R4%R5
	BAL _sub				@ Always Branch to _sub

_exit:
	ADD R4, R4, R5			@ Corrects the extra subtraction done to R4
	ADD R0, R4, #0			@ Test: Shows R4/R5 without remainder
	@ ADD R0, R3, #0		@ Test: Shows R4%R5
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit
	