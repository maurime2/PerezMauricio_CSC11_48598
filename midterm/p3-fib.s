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

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Prompt */
.balign 8
prompt: .asciz "What Fibonacci term would you like to Output (1-47)?:  "

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
divider: .asciz "-------------------------------------------------------\n"

/* Error */
.balign 8
error: .asciz "\n!!!ERROR: Please Input a number greater than zero...!!!\n"

/* Error2 */
.balign 8
error2: .asciz "\n!!!ERROR: Please Input a number between (1 - 47)!!!\n"

/* Comma */
.balign 4
comma: .asciz ", %d"

.text

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
	
	/*Test Input*/
	ldr r1, address_of_fibin   		/* r1 ← &fibin */
	ldr r1, [r1]
	cmp r1, #0						/* Fib <= 0. Branch to Error*/
	ble _er 
	cmp r1, #47						/* Fib <= 0. Branch to Error*/
	ble _f
	b _er2
_f:
	cmp r1, #1						/*If Fib <= 1, Output 1 FIb Sequence*/
	ble _f1
	cmp r1, #2						/*If Fib in is 2, Output 2 FIb Sequence*/
	beq _f2
	b _f2							/*Fib is greater than 2, Output 2 FIb Sequence*/
	
_f1:
	/*Print term 1*/
	ldr r0, address_of_prompt0     	/* r0 ← &Prompt Fib */
    ldr r1, address_of_fibin	  	/* r1 ← &fib in */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */ 
	ldr r1, address_of_fibout	  	/* r1 ← &fib out */
	mov r0, #0
	str r0, [r1]
	b _menu
	
_f2:
	/*Print term 2*/
	ldr r0, address_of_prompt1     	/* r0 ← &Prompt Fib */
    ldr r1, address_of_fibin	  	/* r1 ← &fib in */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	
	/*Store Fib Term*/
	ldr r1, address_of_fibout	  	/* r1 ← &fib out */
	mov r0, #1
	str r0, [r1]
	
	/*Check if Fibin greater than 2*/
	ldr r1, address_of_fibin	  	/* r1 ← &fib in */
	ldr r1, [r1]
	cmp r1, #2						/* Fib <= 2. Branch to menu*/
	ble _menu 

	/*Prep Fot the rest of the sequence*/	
	sub r5, r1, #2					/*Fib in as a counter*/	
	mov r3, #0						/*To calculate new FibOut, Ready r3 and r4 to prepare the rest of the sequence*/
	mov r4, #1

	
_pcom:
	/*Print Comma*/
	add r1, r3, r4					/*Save New Fib Term*/
	ldr r0, address_of_fibout	  	
	str r1, [r0]
	ldr r0, address_of_comma     	/* r0 ← &Prompt comma */
	bl printf
	
	/*Set Up for next value in Sequence*/
	add r3, r4, #0					/*Move r4 to r3*/
	ldr r4, address_of_fibout		/*load last calculated fib out into r4*/
	ldr r4, [r4]
	
	/*Check for more FIb Sequence Prints*/
	sub r5, r5, #1					/*CHeck if more Prints are needed*/
	cmp r5, #0
	ble _menu
	b _pcom
	
_menu:
	/*Print Bar*/
	ldr r0, address_of_prompt2     	/* Prompt for Fib Term */
	ldr r1, address_of_fibin     	/* Load Fib In */
	ldr r1, [r1]
	ldr r2, address_of_fibout     	/* Load Fib Out */
	ldr r2, [r2]
    bl printf                       /* call to printf */

	/*Branch Back to main menu*/
	bal main						@ Branch to Main and output Problem Select

_er:
	/*Print Error*/
	ldr r0, address_of_error     	/* r0 ← &Prompt Fib */
    bl printf                       /* call to printf */ 
	b _start3

_er2:
	/*Print Error*/
	ldr r0, address_of_error2     	/* r0 ← &Prompt Fib */
    bl printf                       /* call to printf */ 
	b _start3
	
_end:
	/*Return to main */
	bal main	
	
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
address_of_comma : .word comma					/*"comma Print"*/
address_of_error : .word error					/*"Divider Bar for prompt"*/
address_of_error2 : .word error2					/*"Overflow Error Prompt"*/

/* External */
.global printf
.global scanf
