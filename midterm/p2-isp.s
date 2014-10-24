/*p2-isp.s File*/
.global _start2


.data

/* Month Rate */
.balign 4
monthrate: .word 0

/* access */
.balign 4
access: .word 0

/* Rate */
.balign 4
rate: .word 0

/*Return*/
.balign 4
return: .word 0

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Prompt0 */
.balign 8
prompt: .asciz "An ISP has 3 different subscription packages\n	1)  $30 per month, 11 hours access.  Additional hours\n	    are $3 up to 22 hours then $6 for all additional\n		hours.\n\n	2)  $35 per month, 22 hours access.  Additional hours\n        are $2 up to 44 hours then $4 for each\n		hour above this limit.\n\n	3)  $40 per month, 33 hours access.  Additional hours\n        are $1 up to 66 hours then $2 for each\n		hour above this limit.\n\n"

/* Prompt */
.balign 8
prompt0: .asciz "Select a Service: \n"

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

	/*Print Divider*/
	ldr r0, address_of_divider     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */

	/*Prompt ISP Rates*/
	ldr r0, address_of_prompt0     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */
	
	/*Prompt User for Input: Rate 1-3*/
	ldr r0, address_of_prompt     	/* Prompt for Input */
    bl printf
	
	/*Scan Input*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_rate   		/* r1 ← &Rate Stored Here */
    bl scanf                        /* call to scanf */

	/*Test Input*/
	ldr r1, address_of_rate   		/* r1 ← &fibin */
	ldr r1, [r1]
	cmp r1, #0						/* Fib <= 0. Branch to Error*/
	ble _end 

	cmp r1, #1						/*If Fib <= 1, Output 1 FIb Sequence*/
	ble _start2
	cmp r1, #2						/*If Fib in is 2, Output 2 FIb Sequence*/
	beq _start2
	cmp r1, #3						/*If Fib in is 2, Output 2 FIb Sequence*/
	beq _start2
	b _end							/*Fib is greater than 2, Output 2 FIb Sequence*/
	
_end:
	/*Return to main */
	bal main						@ Return to Main and output Problem Select

	/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*"Scan Pattern"*/
address_of_monthrate : .word monthrate			/*"Access Hours"*/
address_of_access : .word access				/*"Access Hours"*/
address_of_rate : .word rate			/*"Access Hours"*/
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
