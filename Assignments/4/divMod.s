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

	/*Temp Store for A and B*/
	.balign 8
	TempA: .word 1
	.balign 8
	TempB: .word 2


.text
 
_divMod:
	/*STORE TEMP*/
	ldr r0, address_of_TempA
	str r3, [r0]
	ldr r0, address_of_TempB
	str r4, [r0]	
	
	/*DIV MOD PROMPT*/
	ldr r0, address_of_divPrompt     	/* r0 ← &Problem Selected*/
	ldr r1, address_of_TempA
	ldr r1, [r1]
	ldr r2, address_of_TempB
	ldr r2, [r2]
	bl printf                       /* call to printf */

	ldr r3, address_of_TempA
	ldr r3, [r3]
	ldr r4, address_of_TempB
	ldr r4, [r4]

	/*ADD TO COUNT*/
	add r5, r5, #1
	bal main						@ Branch to Main and output Problem Select
	


/*Messages*/
address_of_divPrompt 	: .word divPrompt				/*"Problem Chosen %d"				*/
address_of_TempA 	: .word TempA				/*"Problem Chosen %d"				*/
address_of_TempB 	: .word TempB				/*"Problem Chosen %d"				*/

/*Messages*/
/* External */
.global printf
.global scanf
