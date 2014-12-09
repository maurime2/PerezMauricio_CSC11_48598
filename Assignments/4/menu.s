/*
Mauricio S. Perez
Midterm: CSC11-48598
Menu: 	EXECUTES PROMPTS AND BRANCHES TO OTHER FILES CONTANINIG PROGRAMS.
*/

.data
/* Problem Chosen */
	.balign 4
	prob: .asciz "Problem Chosen: %d\n"

	/* Select Message */
	.balign 8
	actual1: .asciz "Actual Answer a/b = "
	.balign 8
	actual2: .asciz "Acutal Remainder a%b = "

	/*Calculate Prompt*/
	.balign 8
	calc1: .asciz "Calculated a/b = "
	.balign 8
	calc2: .asciz "Calculated a%b = "

	/*Temp Store for A and B*/
	.balign 8
	A: .word 0
	.balign 8
	B: .word 0

	/*Function Prompts*/
	.balign 8
	divMod: .asciz "Actual Answer a/b = "
	.balign 8
	scaleLeft: .asciz "Acutal Remainder a%b = "
	.balign 8
	addSub: .asciz "Actual Answer a/b = "
	.balign 8
	scaleRight: .asciz "Acutal Remainder a%b = "

	.balign 8
	end: .asciz "Program Ends..."

	/* Format pattern for scanf */
	.balign 4
	scan_pattern : .asciz "%d" 

	/* Choice */
	.balign 4
	choice: .word 0
 	.balign 4
	return: .word 0

	/* Divider */
	.balign 8
	divider: .asciz "************** CSC11-48598 MIDTERM MENU *************\n"

	/* Divider 0 */
	.balign 8
	divider0: .asciz "*****************************************************\n"
 
.text
 
.global main
main:

	/*Print Divider Bar*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

	/*divMod*/
_div:
	ldr r0, address_of_divmod     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */
	@bal _divMod
	
_scL:
	/*scaleLeft*/
	ldr r0, address_of_scaleLeft     	/* r0 ← &Problem Selected */
    bl printf						   /* call to printf */
	@bal _scaleLeft
	
_aSu:
	/*addSub*/
	ldr r0, address_of_select3     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */	
	@bal _addSub

_sRt:
	/*scaleRight*/
	ldr r0, address_of_select4     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */	
	@bal _scaleRight
	
_endProgram:		
	/*End*/
	ldr r0, address_of_end     	 	 /* r0 ← &Problem Selected */
    bl printf                       /* call to printf */		
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit

/*Messages*/
address_of_prob : .word prob					/*"Problem Chosen %d"*/
address_of_actual1 : .word actual1				/*"Actual Answer a/b = :"*/
address_of_actual2 : .word actual2				/*"Actual Answer a/b = :"*/

address_of_calc1 : .word calc1					/*" A "*/
address_of_calc2 : .word calc2					/*" B "*/

address_of_A : .word A							/*" A "*/
address_of_B : .word B							/*" B "*/

address_of_divMod 	 	: .word divMod			/*"divmod Prompt"*/
address_of_scaleLeft 	: .word scaleLeft		/*"scaleleft Prompt"*/
address_of_addSub 	 	: .word addSub			/*"Addsub Prompt"*/
address_of_scaleRight 	: .word scaleRight			/*"Divmod Prompt"*/

address_of_end			: .word end				/*"Divmod Prompt"*/


address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_choice : .word choice				/*Address of Chosen Problem Value*/
address_of_return : .word return				/*Address of Return*/

address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_divider0 : .word divider0			/*"Divider Bar for prompt"*/

/* External */
.global printf
.global scanf
