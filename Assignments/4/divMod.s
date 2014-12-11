/*divMod.s File
Mauricio S. Perez
Midterm: CSC11-48598
divMod
*/
.global _divMod

.data
/* divMod */
	.balign 4
	divPrompt: .asciz "\nIn Divmod %d%d\n"



.text
 
_divMod:

	ldr r0, address_of_divPrompt     	/* r0 ← &Problem Selected*/
	mov r1, r5
	mov r2, r6
	bl printf                       /* call to printf */
	
	/*ADD TO COUNT*/
	add r5, r5, #1
	bal main						@ Branch to Main and output Problem Select
	


/*Messages*/
address_of_divPrompt 	: .word divPrompt				/*"Problem Chosen %d"				*/

/*Messages*/
/* External */
.global printf
.global scanf
