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

/* Prompt */
.balign 8
prompt: .asciz "What Fibonacci term would you like to Output?:  "

/* Prompt0 */
.balign 8
prompt0: .asciz "Fibonacci Sequence up to %d: 0"

/* Prompt1 */
.balign 8
prompt1: .asciz "Fibonacci Sequence up to %d: 0, 1"

/* Prompt2 */
.balign 8
prompt2: .asciz "Your Term is %d, Fibonacci Term is: %d"

/* Divider */
.balign 8
divider: .asciz "\n*****************************************************\n"

_start3:	
	
	
	/*Branch Back to main menu*/
	bal main						@ Branch to Main and output Problem Select


	
/*Messages*/
address_of_fibin : .word fibin					/*"Fib Input"*/
address_of_fibout : .word fibout				/*"Fib Out"*/
address_of_return : .word return				/*"Address Of Return"*/
address_of_prompt : .word prompt				/*"Prompt for input"*/
address_of_prompt0 : .word prompt0				/*"Prompt 0"*/
address_of_prompt1 : .word prompt1				/*"Prompt 1"*/
address_of_prompt2 : .word prompt2				/*"Prompt 2"*/
address_of_divider : .word divider				/*"Divider Bar for prompt
address_of_error : .word error					/*"Divider Bar for prompt


/* External */
.global printf
.global scanf
