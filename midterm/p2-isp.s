/*p2-isp.s File*/
.global _start2


.data

/* Month Rate */
.balign 4
monthrate: .word 30

/* Month Rate 2*/
.balign 4
monthrate2: .word 3

/* Month Rate 3*/
.balign 4
monthrate3: .word 6

/* access */
.balign 4
access: .word 11

/* access2 */
.balign 4
access2: .word 22

/* TOTAL */
.balign 4
total: .word 0

/* Rate */
.balign 4
rate: .word 0

/* Hours */
.balign 4
hours: .asciz ", %d"

/*Return*/
.balign 4
return: .word 0

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Prompt */
.balign 8
prompt: .asciz "An ISP has 3 different subscription packages\n	1)  $30 per month, 11 hours access.  Additional hours\n	    are $3 up to 22 hours then $6 for all additional\n		hours.\n\n	2)  $35 per month, 22 hours access.  Additional hours\n        are $2 up to 44 hours then $4 for each\n		hour above this limit.\n\n	3)  $40 per month, 33 hours access.  Additional hours\n        are $1 up to 66 hours then $2 for each\n		hour above this limit.\n\n"

/* Prompt0 */
.balign 8
prompt0: .asciz "Select a Service: "

/* Prompt1 */
.balign 8
prompt1: .asciz "How many Hours have you Used this Month?: "

/* Prompt2 */
.balign 8
prompt2: .asciz "-------------------------------------------------------\nYou Chosen SP%d, at a total of %d hours of use.\nYour bill will now be calculated...\n-------------------------------------------------------\n"

/* Prompt3 */
.balign 8
prompt3: .asciz "%d hours at $%d per month = $%d\n"

/* Prompt4 */
.balign 8
prompt4: .asciz "-------------------------------------------------------\n Your Total This Month: $%d\n\n\n"

/* Divider */
.balign 8
divider: .asciz "-------------------------------------------------------\n"

/* Error */
.balign 8
error: .asciz "\n!!!ERROR: Please Input 1, 2, or 3!!!\n"

/* Error2 */
.balign 8
error2: .asciz "\n!!!ERROR: Please Input Non Negative Hours!!!\n"

/* Error3 */
.balign 8
error3: .asciz "\n!!!ERROR: Please Input (0-744) Hours!!!\n"


.text
_start2:
	/*Store Zero into TOTAL before executing*/
	ldr r6, address_of_total		/*Load Contents of total*/					
	mov r0, #0
	str r0, [r6]
	
	/*Print Divider*/
	ldr r0, address_of_divider     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */

	/*Prompt ISP Rates*/
	ldr r0, address_of_prompt     	/* Prompt for Fib Term */
    bl printf                       /* call to printf */
	
	/*Prompt User for Input: Rate 1-3*/
	ldr r0, address_of_prompt0     	/* Prompt for Input */
    bl printf
	
	/*Scan Input*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_rate   		/* r1 ← &Rate Stored Here */
    bl scanf                        /* call to scanf */

	/*Test Input: Checks for input*/
	ldr r1, address_of_rate   		/*Rate Loaded into r1 to check if its within scope of 1-3 */
	ldr r1, [r1]					/*If it is, We will need to load values into memory*/
	cmp r1, #0						/* Fib <= 0. Branch to Error*/
	ble _err 
	cmp r1, #1						/*If 1, Go to correct*/
	ble _l1
	cmp r1, #2						/*If 2, Go to correct*/
	beq _l2
	cmp r1, #3						/*If 3, Go to correct*/
	beq _l3
	b _err							/*If input is greater than 3, Output Error*/

_l1:
	ldr r0, address_of_access		/*Corrects Package 1 Rates for Use*/
	mov r1, #11
	str r1, [r0]
	ldr r0, address_of_access2
	mov r1, #22
	str r1, [r0]
	ldr r0, address_of_monthrate
	mov r1, #30
	str r1, [r0]
	ldr r0, address_of_monthrate2
	mov r1, #3
	str r1, [r0]
	ldr r0, address_of_monthrate3
	mov r1, #6
	str r1, [r0]
	b _hours

_l2:
	ldr r0, address_of_access		/*Corrects Package 2 Rates for Use*/
	mov r1, #22
	str r1, [r0]
	ldr r0, address_of_access2
	mov r1, #44
	str r1, [r0]
	ldr r0, address_of_monthrate
	mov r1, #35
	str r1, [r0]
	ldr r0, address_of_monthrate2
	mov r1, #2
	str r1, [r0]
	ldr r0, address_of_monthrate3
	mov r1, #4
	str r1, [r0]
	b _hours
	
_l3:	
	ldr r0, address_of_access		/*Corrects Package 3 Rates for Use*/
	mov r1, #33
	str r1, [r0]
	ldr r0, address_of_access2
	mov r1, #66
	str r1, [r0]
	ldr r0, address_of_monthrate
	mov r1, #40
	str r1, [r0]
	ldr r0, address_of_monthrate2
	mov r1, #1
	str r1, [r0]
	ldr r0, address_of_monthrate3
	mov r1, #2
	str r1, [r0]
	b _hours
	
_hours:	
	/*Prompt User for Input: Hours Used*/
	ldr r0, address_of_prompt1     	/* Prompt for Input */
    bl printf
	
	/*Scan Input*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_hours   		/* r1 ← &Rate Stored Here */
    bl scanf                        /* call to scanf */
	
		/*Test Input*/
	ldr r1, address_of_hours   		/* r1 ← &fibin */
	ldr r1, [r1]
	cmp r1, #0						/* Fib <= 0. Branch to Error*/
	beq _prIns
	cmp r1, #-1						/* Fib <= 0. Branch to Error*/
	ble _err2 
	cmp r1, #744					/* Hours less than or Equal to 744 pass, Branch to prIns*/
	ble _prIns
	b _err3							/*Hours out of scope of a months use, 744 hours in 31 day month*/
	
_prIns:
	/*Prompt Inputs and Input Check before Calc's*/
	ldr r0, address_of_prompt2     	/* Prompt for Fib Term */
	ldr r1, address_of_rate   		/* r1 ← &Hours loaded into r1*/
	ldr r1, [r1]
	ldr r2, address_of_hours  		/* r1 ← &fibin */
	ldr r2, [r2]
    bl printf                       /* call to printf */
	
/*Calculate at Specific Rates*/
_calc1:	
	mov r1, #0					/*Hours For Print*/
	ldr r2, address_of_monthrate/*Load Rate 1 to r1*/
	ldr r2, [r2]
	mov r3, #0					/*Clear R2 for Total Bill*/
	ldr r4, address_of_access	/*Load Access to r4*/
	ldr r4, [r4]
	ldr r5, address_of_hours	/*Load Access to r5*/
	ldr r5, [r5]
	mov r9, #1
	b _calc
	
_calc2:
	mov r1, #0						/*Hours For Print*/
	ldr r2, address_of_monthrate2 	/*Load Rate 1 to r1*/
	ldr r2, [r2]
	mov r3, #0					/*Clear R2 for Total Bill*/
	ldr r4, address_of_access2	/*Load Access to r4*/
	ldr r4, [r4]
	add r9, r9, #1
	b _calc
_calc3:	
	mov r1, #0						/*Hours For Print*/
	ldr r2, address_of_monthrate3 	/*Load Rate 1 to r1*/
	ldr r2, [r2]
	mov r3, #0					/*Clear R2 for Total Bill*/
	add r4, r5, #0				/*Load Remainder of counts to Access to r4*/
	add r9, r9, #1
	b _calc

_calc:
	/*Calculation*/
	cmp r1, r5					/*If user Input is Zero for Hours, Branch to Print*/
	beq _calcP
	
_calcl:
	add r3, r2, r3				/*Increment Total*/
	add r1, r1, #1				/*Increment Hours to be printed*/
	sub r4, r4, #1				/*Increment Hours to be printed*/
	sub r5, r5, #1				/*Increment Hours to be printed*/
	cmp r4, #0
	beq _calcP
	cmp r5, #0
	beq _calcP
	b _calcl
	
_calcP:	
	/*Prints Individual Rate Totals*/
	ldr r0, address_of_prompt3     	/*Prints Total Hours, Rate And Total for Individual Rate*/
	ldr r6, address_of_total		/*Load Contents of total*/
	ldr r6, [r6]					
	add r8, r6, r3					/*New Total*/
	ldr r6, address_of_total
	str r8, [r6]					/*Store Before Printing*/
    bl printf  
	
	/*Branch When Needed*/
	cmp r9, #1
	beq _calc2
	cmp r9, #2
	beq _calc3

	_totalPrint:
	/*Prompt Grand Total*/
	ldr r0, address_of_prompt4     	/*Prompt for Fib Term */
	ldr r1, address_of_total		/*Load Totals for Prompt*/
	ldr r1, [r1]
    bl printf 
	
	
_end:
	/*Return to main */
	bal main						@ Return to Main and output Problem Select

_err:
	/*Print Error*/
	ldr r0, address_of_error     	/* r0 ← &Prompt Fib */
    bl printf                       /* call to printf */ 
	b _start2

_err2:
	/*Print Error*/
	ldr r0, address_of_error2     	/* r0 ← &Prompt Fib */
    bl printf                       /* call to printf */ 
	b _hours

_err3:
	/*Print Error*/
	ldr r0, address_of_error3     	/* r0 ← &Prompt Fib */
    bl printf                       /* call to printf */ 
	b _hours
	
	/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*"Scan Pattern"*/
address_of_total : .word total			/*"Monthly Rate"*/
address_of_monthrate : .word monthrate			/*"Monthly Rate"*/
address_of_monthrate2 : .word monthrate2		/*"Monthly Rate2"*/
address_of_monthrate3 : .word monthrate3		/*"Monthly Rate3"*/
address_of_access : .word access				/*"Access Hours"*/
address_of_access2 : .word access2				/*"Access Hours2"*/
address_of_rate : .word rate					/*"Rate Chosen for ISP Service"*/
address_of_hours : .word hours					/*"comma hours"*/
address_of_return : .word return				/*"Address Of Return"*/
address_of_prompt : .word prompt				/*"Prompt  : Rates"*/
address_of_prompt0 : .word prompt0				/*"Prompt 0: Service Prompt"*/
address_of_prompt1 : .word prompt1				/*"Prompt 1: Hours Prompt"*/
address_of_prompt2 : .word prompt2				/*"Prompt 2: Check Inputs Prompt and Total Calc Notification"*/
address_of_prompt3 : .word prompt3				/*"Prompt 3: Totals for each Hourly Rate"*/
address_of_prompt4 : .word prompt4				/*"Prompt 3: Totals Output"*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_error : .word error					/*"Error Prompt 1: Did not select a package 1-3"*/
address_of_error2 : .word error2				/*"Error Prompt 2: Hours input were Negative"*/
address_of_error3 : .word error3				/*"Error Prompt 3: Hours not in scope of 0-744 hours"*/

/* External */
.global printf
.global scanf
