/*
Mauricio S. Perez
Midterm: CSC11-48598
Menu: 	EXECUTES PROMPTS AND BRANCHES TO OTHER FILES CONTANINIG PROGRAMS.

	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
	Divisor Scale -> r4 
	Subtraction Scale -> r5 = b*r4
*/

.data
/* Address of Return */
	.balign 4
	return: .word 0
	.balign 4
	jump: .word 0

/* Problem Chosen */
	.balign 4
	prob: .asciz "\nProblem Chosen: %d\n"
	.balign 4
	Input1: .asciz "\nInput Number 1 (NUMERATOR):"
	.balign 4
	Input2: .asciz "Input Number 2 (DENOMINATOR):"	
	
	/* Select Message */
	.balign 8
	actual1: .asciz "\nDEFULT: [IF THESE WERE INPUT]\nActual Answer    a/b (of 111/5) = 22.2\n"
	.balign 8
	actual2: .asciz "\nA/B (of %d/%d) = \n"
	
	/*Calculate Prompt*/
	.balign 8
	calc0: .asciz "\n A/B = %d/%d: "
	.balign 8
	calc1: .asciz "\nCalculated a/b = %d"
	.balign 8
	calc2: .asciz "\nCalculated a%b = %d "

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
	divMod: .asciz "\nDIV MOD Start:"
	.balign 8
	scaleLeft: .asciz "\nSCALE LEFT Start:"
	.balign 8
	addSub: .asciz "\nADD SUB Start:"
	.balign 8
	scaleRight: .asciz "\nSCALE RIGHT Start:"
	.balign 8
	endP: .asciz "\nProgram Ends..."

	/* Format pattern for scanf */
	.balign 4
	scan_pattern : .asciz "%d" 

	/* Choice */
	.balign 4
	choice: .word 0

	/* Divider */
	.balign 8
	divider: .asciz "******************************************************\n"

	/* Divider 0 */
	.balign 8
	divider0: .asciz "*****************************************************\n"
 
.text
 
.global main
main:

	/*RETURN so it can Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
	str lr, [r1]                    /* *r1 ? lr */
	
	/*Jump will determine where the program will go*/
	cmp r5, #1
	beq _endProgram
	
	/*Reset Return*/
	ldr r1, address_of_jump       /* r1 ? &address_of_return */
	mov r0, #0
	str r0, [r1]                    /* *r1 ? lr */
	
	/*PROMPT INPUT NUMERATOR */
	ldr r0, address_of_Input1    	 	/* r0 ← &Problem Selected */
	bl printf						   /* call to printf */

		/*Input Both Numerator (TOP) & Denominator (DENOMINATOR)*/
		ldr r0, address_of_scan_pattern       /* r1 ? &address_of_return */
		ldr r1, address_of_A       /* r0 ? &address_of_return */
		bl scanf 
	
			/*PROMPT INPUT DENOMINATOR */
			ldr r0, address_of_Input2    	 	/* r0 ← &Problem Selected */
			bl printf						   /* call to printf */
	
				/*Input Both Numerator (TOP) & Denominator (DENOMINATOR)*/
				ldr r0, address_of_scan_pattern        /* r1 ? &address_of_return */
				ldr r1, address_of_B       		/* r0 ? &address_of_return */
				bl scanf 	

	/*ACTUAL ANSWERS IF INPUTED IN THIS WAY*/
	ldr r0, address_of_actual1    	  /* r0 ← & ACTUAL PROMPT	*/
	bl printf						 /* call to printf 		   */

/*divMod*/
_div:
	ldr r3, address_of_A
	ldr r3, [r3]
	ldr r4, address_of_B
	ldr r3, [r4]
	bl _divMod

_endProgram:
	ldr r0, address_of_AdivB
	str r3, [r0]
	ldr r0, address_of_AmodB
	str r4, [r0]

	ldr r0, address_of_calc1	  	/* r0 ← &Problem Selected*/
	mov r1, r3
	bl printf                       /* call to printf */
	
	ldr r0, address_of_calc2	  	/* r0 ← &Problem Selected*/
	mov r1, r4
	bl printf                       /* call to printf */	
		
	/*End*/
	ldr r0, address_of_endP     	 	 /* r0 ← &Problem Selected */
    bl printf                       /* call to printf */		
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit

/*Messages*/
address_of_return : .word return				/*Address of Return					*/
address_of_jump : .word jump					/*Address of Jump					*/
address_of_prob 	: .word prob				/*"Problem Chosen %d"				*/
address_of_Input1 	: .word Input1				/*"Prompt: Input1"					*/
address_of_Input2 	: .word Input2				/*"Prompt: Input1"					*/

address_of_actual1 	: .word actual1				/*"Actual Answer a/b = :"			*/
address_of_actual2 	: .word actual2				/*"Actual Answer a/b = :"			*/

address_of_calc0 	: .word calc0				/*" calc0 "							*/
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
address_of_endP			: .word endP			/*"Divmod Prompt"					*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern						*/
address_of_choice 	: .word choice				/*Address of Chosen Problem Value	*/

address_of_divider 	: .word divider				/*"Divider Bar for prompt"			*/
address_of_divider0 : .word divider0			/*"Divider Bar for prompt"			*/

/* External */
.global printf
.global scanf
