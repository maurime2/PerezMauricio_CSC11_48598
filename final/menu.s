/*
Mauricio S. Perez
Final: CSC11-48598
Menu: 	EXECUTES PROMPTS AND BRANCHES TO OTHER FILES CONTANINIG PROGRAMS.
*/

.data
/* Problem Chosen */
.balign 4
prob: .asciz "Problem Chosen: %d\n"

/* Select Message */
.balign 8
select: .asciz "Select a Problem:\n 1. Guess the Number\n 2. Array Fill\n 3.Newtons Method\n 4.Quadratic Equation\n Input your Choice:"

/* Select 1 */
.balign 4
select1: .asciz "Problem 1: Guess the Number\n\n"

/* Select 2 */
.balign 4
select2: .asciz "Problem 2: Array Fill(NOT DONE)\n\n"

/* Select 3 */
.balign 4
select3: .asciz "Problem 3: Newtons Method (NOT DONE)\n\n"

/* Select 4 */
.balign 4
select4: .asciz "Problem 4: Quadratic Equation (NOT DONE)\n\n"

/* Midterm End! */
.balign 4
select5: .asciz "Final Complete!!! \n"

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
divider: .asciz "************** CSC11-48598 FINAL MENU *************\n"

/* Divider 0 */
.balign 8
divider0: .asciz "*****************************************************\n"
 
.text
 
.global main
main:

	/*Print Divider Bar*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_divider0     /* Prompt for Hours */
    bl printf                       /* call to printf */

	/*Print Divider Bar*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_divider     	/* Prompt for Hours */
    bl printf                       /* call to printf */
	
	/*Print Divider Bar*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_divider0     /* Prompt for Hours */
    bl printf                       /* call to printf */
	
@_again:
	str lr, [sp]					/*Link Register into Stack Pointer*/
	/*Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_select     	/* Load Address of Select */
    bl printf                       /* call to printf */
	
	/*Scan Choice*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_choice   	/* r1 ← &number_a */
    bl scanf                        /* call to scanf */

	/*Problem Chosen*/
	ldr r0, address_of_prob     	/* r0 ← &Problem Selected */
    ldr r1, address_of_choice	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */

	/*Compare 1*/
    ldr r1, address_of_choice	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
	cmp r1, #1         				/* compare r0 and 1 */
    beq _p1						    /* if r0 != 1 then branch */
	cmp r1, #2         				/* compare r0 and 2 */
    beq _p2						    /* if r0 != 2 then branch */
	cmp r1, #3         				/* compare r0 and 3 */
    beq _p3						    /* if r0 != 3 then branch */
	cmp r1, #4         				/* compare r0 and 3 */
    beq _p4	
	b _end
	
	/*Problem 1*/
_p1:
	ldr r0, address_of_select1     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */
	bal _randTest
	
_p2:
	/*Problem 2*/
	ldr r0, address_of_select2     	/* r0 ← &Problem Selected */
    bl printf						/* call to printf */
	bal _array
	
_p3:
	/*Problem 3*/
	ldr r0, address_of_select3     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */	
	bal _newt

_p4:
	/*Problem 4*/
	ldr r0, address_of_select4     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */	
	bal _quad
	
_end:		
	/*End*/
	ldr r0, address_of_select5     	/* r0 ← &Problem Selected */
    bl printf                       /* call to printf */		
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit

/*Messages*/
address_of_prob : .word prob					/*"Problem Chosen %d"*/
address_of_select : .word select				/*"Select a Problem:"*/
address_of_select1 : .word select1				/*"Problem 1: "*/
address_of_select2 : .word select2				/*"Problem 2: "*/
address_of_select3 : .word select3				/*"Problem 3: "*/
address_of_select4 : .word select4				/*"PROJECT MASTERMIND "*/
address_of_select5 : .word select5				/*"End Prompt"*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_choice : .word choice				/*Address of Chosen Problem Value*/
address_of_return : .word return				/*Address of Return*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_divider0 : .word divider0			/*"Divider Bar for prompt"*/

/* External */
.global printf
.global scanf
