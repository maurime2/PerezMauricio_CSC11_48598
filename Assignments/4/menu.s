/*
Mauricio S. Perez
Midterm: CSC11-48598
Menu: 	EXECUTES PROMPTS AND BRANCHES TO OTHER FILES CONTANINIG PROGRAMS.
*/

.data
/* Address of Return */
	.balign 4
	return: .word 0

/* Problem Chosen */
	.balign 4
	prob: .asciz "\nProblem Chosen: %d\n"

	/* Select Message */
	.balign 8
	actual1: .asciz "\nActual Answer a/b = "
	.balign 8
	actual2: .asciz "\nAcutal Remainder a%b = "

	/*Calculate Prompt*/
	.balign 8
	calc1: .asciz "\nCalculated a/b = "
	.balign 8
	calc2: .asciz "\nCalculated a%b = "

	/*Temp Store for A and B*/
	.balign 8
	A: .word 1
	.balign 8
	B: .word 2
	.balign 8
	AdivB: .word 1
	.balign 8
	AmodB: .word 2

	/*Function Prompts*/
	.balign 8
	divMod: .asciz "\nActual Answer a/b = "
	.balign 8
	scaleLeft: .asciz "\nAcutal Remainder a%b = "
	.balign 8
	addSub: .asciz "\nActual Answer a/b = "
	.balign 8
	scaleRight: .asciz "\nAcutal Remainder a%b = "
	.balign 8
	end: .asciz "\nProgram Ends..."

	/* Format pattern for scanf */
	.balign 4
	scan_pattern : .asciz "%d" 

	/* Choice */
	.balign 4
	choice: .word 0

	/* Divider */
	.balign 8
	divider: .asciz "************** CSC11-48598 MIDTERM MENU *************\n"

	/* Divider 0 */
	.balign 8
	divider0: .asciz "*****************************************************\n"
 
.text
 
.global main
main:
	/*RETURN so it can Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

	ldr r0, address_of_divMod     	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_scaleLeft   	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_addSub     	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_scaleRight  	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_calc1	  	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_calc2	  	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */	

	ldr r0, address_of_actual1	  	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */

	ldr r0, address_of_actual2	  	/* r0 ← &Problem Selected*/
	bl printf                       /* call to printf */	

	ldr r0, address_of_prob		  	/* r0 ← &Problem Selected*/
	ldr r1, address_of_A
	ldr r1, [r1]
	bl printf                       /* call to printf */

	ldr r0, address_of_prob		  	/* r0 ← &Problem Selected*/
	ldr r1, address_of_B
	ldr r1, [r1]
	bl printf                       /* call to printf */
		
/*divMod*/
_div:
		ldr r0, address_of_divMod     	/* r0 ← &Problem Selected*/
		bl printf                       /* call to printf */
		/*bal _divMod*/
	
_scL:
		/*scaleLeft*/
		ldr r0, address_of_scaleLeft     	/* r0 ← &Problem Selected */
		bl printf						   /* call to printf */
		/*bal _scaleLeft*/
	
_aSu:
		/*addSub*/
		ldr r0, address_of_addSub     	/* r0 ← &Problem Selected */
		bl printf                       /* call to printf */	
		/*bal _addSub*/

_sRt:
		/*scaleRight*/
		ldr r0, address_of_scaleRight     	/* r0 ← &Problem Selected */
		bl printf                       /* call to printf */	
		/*bal _scaleRight*/
	
_endProgram:		
	/*End*/
	ldr r0, address_of_end     	 	 /* r0 ← &Problem Selected */
    bl printf                       /* call to printf */		
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit

/*Messages*/
address_of_return : .word return				/*Address of Return					*/
address_of_prob 	: .word prob				/*"Problem Chosen %d"				*/
address_of_actual1 	: .word actual1				/*"Actual Answer a/b = :"			*/
address_of_actual2 	: .word actual2				/*"Actual Answer a/b = :"			*/
address_of_calc1 	: .word calc1				/*" calc1 "							*/
address_of_calc2 	: .word calc2				/*" calc2 "							*/
address_of_A 		: .word A					/*" A "								*/
address_of_B 		: .word B					/*" B "								*/
address_of_AdivB 		: .word AdivB					/*" A "								*/
address_of_AmodB 		: .word AmodB					/*" B "								*/

address_of_divMod 	 	: .word divMod			/*"divmod Prompt"					*/
address_of_scaleLeft 	: .word scaleLeft		/*"scaleleft Prompt"				*/
address_of_addSub 	 	: .word addSub			/*"Addsub Prompt"					*/
address_of_scaleRight 	: .word scaleRight		/*"Divmod Prompt"					*/
address_of_end			: .word end				/*"Divmod Prompt"					*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern						*/
address_of_choice 	: .word choice				/*Address of Chosen Problem Value	*/

address_of_divider 	: .word divider				/*"Divider Bar for prompt"			*/
address_of_divider0 : .word divider0			/*"Divider Bar for prompt"			*/

/* External */
.global printf
.global scanf