/*p3-fib.s File
Mauricio S. Perez
Midterm: CSC11-48598
Program 3: Fibonacci Print
*/

.global _start3

.data

/* FIB in */
.balign 4
fibin: .word 0

/* FIB OUT */
.balign 4
fibout: .word 0

/*Return*/
.balign 4
return: .word 0

.text

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Prompt */
.balign 8
prompt: .asciz "What Fibonacci term would you like to Output?:  "

/* Prompt0 */
.balign 8
prompt0: .asciz "Fibonacci Sequence up to %d: 0\n"

/* Prompt1 */
.balign 8
prompt1: .asciz "Fibonacci Sequence up to %d: 0, 1\n"

/* Prompt2 */
.balign 8
prompt2: .asciz "Your Term is %d, Fibonacci Term is: %d"

/* Divider */
.balign 8
divider: .asciz "\n*****************************************************\n"

/* Comma */
.balign 4
comma: .asciz ", "

_start3:	
	/*Print Bar*/
	ldr r0, address_of_divider     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */

	/*Ask User for Fib Term*/
	ldr r0, address_of_prompt     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */

	/*Scan Fib*/
	ldr r0, address_of_scan_pattern	/* r0 ← &Prompt_fibin Scan */
    ldr r1, address_of_fibin   		/* r1 ← &fibin */
    bl scanf                        /* call to scanf */
	
	ldr r1, address_of_fibin   		/* r1 ← &fibin */
	ldr r1, [r1]
	cmp r1, #0
	ble _error 
	
	
	
	/*Print term 1*/
	ldr r0, address_of_prompt0     	/* r0 ← &Prompt Fib */
    ldr r1, address_of_fibin	  	/* r1 ← &fib in */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf 
	
	/*Print term 2*/
	ldr r0, address_of_prompt1     	/* r0 ← &Prompt Fib */
    ldr r1, address_of_fibin	  	/* r1 ← &fib in */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf 
	
	
_error:
	b _start3

	/*Branch Back to main menu*/
	bal main						@ Branch to Main and output Problem Select


	
/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_fibin : .word fibin					/*"Fib Input"*/
address_of_fibout : .word fibout				/*"Fib Out"*/
address_of_return : .word return				/*"Address Of Return"*/
address_of_prompt : .word prompt				/*"Prompt for input"*/
address_of_prompt0 : .word prompt0				/*"Prompt 0"*/
address_of_prompt1 : .word prompt1				/*"Prompt 1"*/
address_of_prompt2 : .word prompt2				/*"Prompt 2"*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_comma : .word divider				/*"comma Print"*/
address_of_error : .word error					/*"Divider Bar for prompt"*/


/* External */
.global printf
.global scanf
