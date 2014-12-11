/*divMod.s File
Mauricio S. Perez
Midterm: CSC11-48598
divMod
*/
.global _divMod

.data
/* divMod */
	.balign 4
	divPrompt: .asciz "\nProblem Chosen: %d\n"



.text
 
_divMod:
	add r1, r1, #1
	ldr r0, address_of_divPrompt     	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */
		b _endProgram
	bal main						@ Branch to Main and output Problem Select
	


/*Messages*/
address_of_divPrompt 	: .word divPrompt				/*"Problem Chosen %d"				*/

/*Messages*/
/* External */
.global printf
.global scanf
