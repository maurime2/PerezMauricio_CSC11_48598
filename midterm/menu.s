/*
Mauricio S. Perez
Midterm: CSC11-48598
Menu
*/

.data
/* Problem Chosen */
.balign 4
prob: .asciz "Problem Chosen: %d\n"

/* Select Message */
.balign 4
select: .asciz "Select a Problem: "

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Choice */
.balign 4
choice: .word 0
 
.balign 4
return: .word 0

 
.text
 
.global main
main:
	/*Print*/
	ldr r1, address_of_return        /* r1 ? &address_of_return */
    str lr, [r1]                     /* *r1 ? lr */

    ldr r0, address_of_select     	/* Load Address of Select */
    bl printf                       /* call to printf */
	
	/*Scan Choice*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_choice   	/* r1 ← &number_a */
    bl scanf                        /* call to scanf */

	/*Problem Chosen*/
	ldr r0, address_of_prob     	/* r0 ← &Problem Selected */
    ldr r1, address_of_choice	  	/* r1 ← &number_a */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0					@ Software Interrupt: Exit

/*Messages*/
address_of_prob : .word prob
address_of_select : .word select
address_of_scan_pattern : .word scan_pattern
address_of_choice : .word choice
address_of_return : .word return

/* External */
.global printf
.global scanf
