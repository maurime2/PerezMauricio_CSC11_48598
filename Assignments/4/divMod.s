/*divMod.s File
Mauricio S. Perez
Midterm: CSC11-48598
divMod
*/
.global _divMod

.data
/* divMod */
	.balign 4
	divPrompt: .asciz "\nIn Divmod: %d/%d:\n"

	/*Temp Store for A and B*/
	.balign 8
	TempA: .word 0
	.balign 8
	TempB: .word 0
	.balign 8
	TempC: .word 0

.text
 
_divMod:
	/*STORE TEMP*/
	ldr r0, address_of_TempA
	str r3, [r0]
	ldr r0, address_of_TempB
	str r4, [r0]	
	ldr r0, address_of_TempC
	str r5, [r0]	
	
	/*DIV MOD PROMPT*/
	ldr r0, address_of_divPrompt     	/* r0 ← &Problem Selected*/
	ldr r1, address_of_TempA
	ldr r1, [r1]
	ldr r2, address_of_TempB
	ldr r2, [r2]
	bl printf                       /* call to printf */
	
/*DIVISION PROGRAM STARTS HERE*/
	ldr R4, address_of_TempA				@ Number to divide / Will hold remainder.
	ldr R4, [r4]
	ldr R5, address_of_TempB				@ Number to divide by.
	ldr R5, [r5]
	ldr R1, address_of_TempC				@ Number to hold times divided by value.
	ldr R1, [r1]
	
_sub:						@ Subtraction Happens HERE.
	SUBS R4, R4, R5
	BMI _exit				@ If Negative, branch to exit.

_add:						@ Increment R3 HERE
	ADD R1, R1, #1			@ Will Hold value of R4/R5
	BAL _sub				@ Always Branch to _sub

_exit:
	ADDs R0, R4, R5			@ Corrects the extra subtraction, a%b = R0

	mov r3, r1
	mov r4, r0

	/*STORE */
	ldr r0, address_of_TempA	/* TEMP A now represents A/B */
	ldr r3, [r0]
	ldr r0, address_of_TempB	/* TEMP B now represents A%B */
	ldr r4, [r0]
	
	/*Load to print*/
	ldr r3, address_of_TempA	/* TEMP A now represents A/B */
	ldr r3, [r3]
	ldr r4, address_of_TempB	/* TEMP B now represents A%B */
	ldr r0, [r4]
	ldr r5, address_of_TempC	/* TEMP B now represents A%B */
	ldr r5, [r5]

	/*ADD TO COUNT*/
	add r5, r5, #1
	bal main						@ Branch to Main and output Problem Select
	


/*Messages*/
address_of_divPrompt 	: .word divPrompt			/*"PROMPTS INSIDE DIVMOD"			*/
address_of_TempA 		: .word TempA				/*"Problem Chosen %d"				*/
address_of_TempB 		: .word TempB				/*"Problem Chosen %d"				*/
address_of_TempC 		: .word TempC				/*"Problem Chosen %d"				*/

/*Messages*/
/* External */
.global printf
.global scanf
