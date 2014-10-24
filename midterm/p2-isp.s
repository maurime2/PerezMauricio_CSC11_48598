/*p2-isp.s File*/
.global _start2


.data

/* Month Rate */
.balign 4
monthrate: .word 0

/* access */
.balign 4
access: .word 0

/*Return*/
.balign 4
return: .word 0

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
prompt1: .asciz "Fibonacci Sequence up to %d: 0, 1"

/* Prompt2 */
.balign 4
prompt2: .asciz "\nF[%d]= %d\n"

/* Divider */
.balign 8
divider: .asciz "\n*****************************************************\n"

/* Error */
.balign 8
error: .asciz "\n!!!ERROR: Please Input a number greater than zero...!!!\n"

/* Comma */
.balign 4
comma: .asciz ", %d"

.text
_start2:


	/*Return to main */
	bal main						@ Return to Main and output Problem Select

	/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*"Scan Pattern"*/
address_of_monthrate : .word monthrate			/*"Access Hours"*/
address_of_access : .word access				/*"Access Hours"*/
address_of_return : .word return				/*"Address Of Return"*/
address_of_prompt : .word prompt				/*"Prompt for input"*/
address_of_prompt0 : .word prompt0				/*"Prompt 0"*/
address_of_prompt1 : .word prompt1				/*"Prompt 1"*/
address_of_prompt2 : .word prompt2				/*"Prompt 2"*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_comma : .word comma					/*"comma Print"*/
address_of_error : .word error					/*"Divider Bar for prompt"*/


/* External */
.global printf
.global scanf
