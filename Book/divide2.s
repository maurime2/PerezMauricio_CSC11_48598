/**** Divide Program: Mauricio S. Perez ****/
/**** DUE DATE: OCTOBER 1st 2014        ****/
/**** CSC11 - 48598 					****/
/**** Program 2: Divide Without Flags	****/
/**** Outputs: R0 -> a%b 				****/
/**** 		   R1 -> a/b				****/

	.global _start
_start:
	MOV R4, #111			@ Number to divide / Will hold remainder.
	MOV R5, #5				@ Number to divide by.
	MOV R1, #0				@ Number to hold times divided by value.
	
_sub:						@ Subtraction Happens HERE.
	SUBS R4, R4, R5
	BMI _exit				@ If Negative, branch to exit.

_add:						@ Increment R3 HERE
	ADD R1, R1, #1			@ Will Hold value of R4%R5
	BAL _sub				@ Always Branch to _sub

_exit:
	ADD R0, R4, R5			@ Corrects the extra subtraction, a%b = R0
	@ ADD R0, R1, #0		@ Test: Shows R4/R5 in R1
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit
	