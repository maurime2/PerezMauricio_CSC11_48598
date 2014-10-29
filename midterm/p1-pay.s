/*p1-pay.s File
Mauricio S. Perez
Midterm: CSC11-48598
Program 1: PAY
*/

.global _start1

.data
/* Select Message */
.balign 4
select: .asciz "Input Total Hours Worked (Max 60): "

/* Select Message */
.balign 4
selectw: .asciz "Input  Hourly  Wage (No Decimal) : "

/* Select 0 */
.balign 8
select0: .asciz "Error: Please Try Again\n"

/* Select 1 */
.balign 8
select1: .asciz "Straight Time(1-20 Hrs): $%d An Hour for %d Hrs = $%d\n"

/* Select 2 */
.balign 8
select2: .asciz "Double Time (21-40 Hrs): $%d An Hour for %d Hrs = $%d\n"

/* Select 3 */
.balign 8
select3: .asciz "Triple Time (41-60 Hrs): $%d An Hour for %d Hrs = $%d\n"

/* Select 4 */
.balign 4
select4: .asciz "Total Pay: %d Hrs = %d Dollars \n"

/* Select 5 */
.balign 8
select5: .asciz "                              TOTAL PAY (%d Hrs): $%d\n\n"

/* Select 6 */
.balign 8
select6: .asciz "                              TOTAL PAY (%d Hrs): $%d\n\n"

/* Hours Worked */
.balign 4
hwork: .asciz "Hours Worked: %d\n"

/* Wage Per Hour*/
.balign 4
wph: .asciz "Wage Per Hour : %d\n"

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Hours */
.balign 4
hours: .word 0

/* Total */
.balign 4
total: .word 0

/* Pay1 */
.balign 4
pay1: .word 0

/* Pay2 */
.balign 4
pay2: .word 0

/* Pay3 */
.balign 4
pay3: .word 0

/* count */
.balign 4
count: .word 20

/*Return*/
.balign 4
return: .word 0

/* Divider */
.balign 8
divider: .asciz "-------------------------------------------------------\n"

.text
 
_start1:
	/*Print Divider Bar*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */
    ldr r0, address_of_divider     	/* Prompt for Hours */
    bl printf                       /* call to printf */
	
	/*PRINT PROMPT: ASK FOR HOURS*/
	str lr, [sp]					/*Link Register into Stack Pointer*/
	/*Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_select     	/* Prompt for Hours */
    bl printf                       /* call to printf */
		
	/*Scan Hours*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_hours   	/* r1 ← &number_a */
    bl scanf                        /* call to scanf */

	
	
	
	
	
	/*Print BACK HOURS*/
	ldr r0, address_of_hwork     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf 
	
	
	
	/*Ask For Wage*/
	str lr, [sp]					/*Link Register into Stack Pointer*/
	/*Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_selectw     	/* Prompt for Hours */
    bl printf                       /* call to printf */
		
	/*Scan Hours*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_pay1   		/* r1 ← &number_a */
    bl scanf                        /* call to scanf */
	
	/*Print BACK HOURS*/
	ldr r0, address_of_wph     		/* r0 ← &Problem Selected */
    ldr r1, address_of_pay1	  		/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf  
	
	/*Save Double and Triple Wage Per Hour*/
	ldr r1, address_of_pay1	  		/* r1 ← &pay1 */
    ldr r1, [r1]                    /* r1 ← *r1 */
	add r2, r1, r1					/*Double Pay*/
	ldr r0, address_of_pay2	  		/*Double Pay Store*/
	str r2, [r0]
	add r2, r2, r1					/*Triple Pay*/
	ldr r0, address_of_pay3	  		/*Triple Pay Store*/
	str r2, [r0]
	
_h1:
	/*Set Up for Straight Time*/
	mov r1, #0						/*Holds count for total hours worked(of each class)*/
	mov r2, #0						/*Holds Total pay for class amount*/
	ldr r6, address_of_pay1	  		/* r6 ← &_pay1  */
    ldr r6, [r6]                    /* r6 ← *r6 ($8)*/
	ldr r4, address_of_hours		/*Holds address of total hours (all hours)*/
	ldr r4, [r4]					/*Holds total hours (all hours)*/
	mov r5, #20						/*Count 20 for each class */
	/*Input Validation: Ask for prompt again if Hours<0, or greater than 60*/
	cmp r4, #-1         			/* compare r4 and 0 */
    ble _pre						/* if r0 <= 0 then branch error */
	cmp r4, #0         			/* compare r4 and 0 */
    beq _zero						/* if r0 == 0 then branch to _zero where it will prompt no Hours Worked */
	cmp r4, #60         			/* compare r4 and 60 */
	ble _h1c						/* if r4 <= 60 then branch to _h1c */
	b _pre							/* r4 >= 60, branch to _pre */
	
	/*Calculate Straight Time*/
	cmp r1, r4         				/* compare Count in r0 to total hours in r4 */
    beq _pr1						/* Branch to print if zero hours */
_h1c:
	add r1, r1, #1					/*Add increment to hours*/
	add r2, r2, r6					/*Add hourly pay*/
	sub r4, r4, #1					/*Decriment total hours*/
	sub r5, r5, #1					/*Decriment Count*/
	cmp r4, #0						/*Compare total hours, If zero, Print*/
	beq _pr1						/**/
	cmp r5, #0						/*Compare total hours, If zero, Print*/
	beq _pr1						/**/
	b _h1c
	
_pr1:
	/*Save 1*/
	ldr r0, address_of_total		/*Store total before cont*/
	str r2, [r0]

	/*Print Straight Hours*/
	ldr r0, address_of_select1     	/* r0 ← &Straight Time Prompt*/
	add r3, r2, #0					/*LAST MINUTE FIX: Had 2 output registers for prompts:*/
	add r2, r1, #0					/*  Changed it to 3 last minute, Had to shift registers */
	add r1, r6, #0					/*  by one, Then change them back after Print*/
    bl printf                       /*Call to printf */
	
	/*Set Up for Double Pay*/
	cmp r4, #0						/*Compare total hours, If zero, End*/
	beq _ret	
	mov r1, #0
	mov r2, #0
	mov r5, #20						/*Reset Counter*/
	ldr r6, address_of_pay2			/*Load Pay 2*/
	ldr r6, [r6]
	
_h2c:
	add r1, r1, #1					/*Add increment to hours*/
	add r2, r2, r6					/*Add hourly pay*/
	sub r4, r4, #1					/*Decriment total hours*/
	sub r5, r5, #1					/*Decriment Count*/
	cmp r4, #0						/*Compare total hours, If zero, Print*/
	beq _pr2						/**/
	cmp r5, #0						/*Compare total hours, If zero, Print*/
	beq _pr2						/**/
	b _h2c
	
_pr2:
	/*Save 2*/
	ldr r0, address_of_total		/*Store total before cont*/
	ldr r0, [r0]					/*Load Last Total*/
	add r5, r2, r0					/*Add totals together*/
	ldr r0, address_of_total		/*Store total before cont*/
	str r5, [r0]					/*Store again*/
	
	
	/*Print Double Hours*/
	ldr r0, address_of_select2     	/* r0 ← &Problem Selected */
	add r3, r2, #0					/*LAST MINUTE FIX: Had 2 output registers for prompts:*/
	add r2, r1, #0					/*  Changed it to 3 last minute, Had to shift registers */
	add r1, r6, #0					/*  by one, Then change them back after Print*/
    bl printf                       /*Call to printf */
	mov r3, #0
	
	/*Set Up for Triple Pay*/
	cmp r4, #0						/*Compare total hours, If zero, End*/
	beq _ret	
	mov r1, #0
	mov r2, #0
	mov r5, #20						/*Reset Counter*/
	ldr r6, address_of_pay3			/*Load Pay 2*/
	ldr r6, [r6]
	
_h3c:
	add r1, r1, #1					/*Add increment to hours*/
	add r2, r2, r6					/*Add hourly pay*/
	sub r4, r4, #1					/*Decriment total hours*/
	sub r5, r5, #1					/*Decriment Count*/
	cmp r4, #0						/*Compare total hours, If zero, Print*/
	beq _pr3						/**/
	cmp r5, #0						/*Compare total hours, If zero, Print*/
	beq _pr3						/**/
	b _h3c
	
_pr3:
	/*Save 3*/
	ldr r0, address_of_total		/*Store total before cont*/
	ldr r0, [r0]					/*Load Last Total*/
	add r5, r2, r0					/*Add totals together*/
	ldr r0, address_of_total		/*Store total before cont*/
	str r5, [r0]					/*Store again*/

	/*Print Triple Hours*/
	ldr r0, address_of_select3     	/* r0 ← &Problem Selected */
    add r3, r2, #0					/*LAST MINUTE FIX: Had 2 output registers for prompts:*/
	add r2, r1, #0					/*  Changed it to 3 last minute, Had to shift registers */
	add r1, r6, #0					/*  by one, Then change them back after Print*/
    bl printf                       /*Call to printf */
	ldr r2, address_of_total
	ldr r2, [r2]
	mov r3, #0
	b _ret							/*Branch Back to Menu*/

_pre:
	/*Print Error*/
	ldr r0, address_of_select0     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */	
	b _start1						/*Branch Back to Start*/

	/*Return to main*/
_ret:
	ldr r1, address_of_hours
	ldr r1, [r1]
	ldr r2, address_of_total
	ldr r2, [r2]
	ldr r0, address_of_select5     	/* r0 ← &Total Print */
    bl printf                       /* call to printf */

	bal main						@ Branch to Main and output Problem Select

_zero:
	ldr r1, address_of_hours
	ldr r1, [r1]
	ldr r2, address_of_total
	ldr r2, [r2]
	ldr r0, address_of_select6     	/* r0 ← &Total Print */
    bl printf                       /* call to printf */	
	bal main						@ Branch to Main and output Problem Select
	
	
/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_select : .word select				/*"Select a Problem:"*/
address_of_selectw : .word selectw				/*"Select a Problem:"*/
address_of_select0 : .word select0				/*"Problem 0: Error "*/
address_of_select1 : .word select1				/*"Problem 1: "*/
address_of_select2 : .word select2				/*"Problem 2: "*/
address_of_select3 : .word select3				/*"Problem 3: "*/
address_of_select4 : .word select4				/*"End Prompt"*/
address_of_select5 : .word select5				/*"Total Prompt"*/
address_of_select6 : .word select6				/*"No Hours Worked"*/
address_of_hours : .word hours					/*Address of Hours*/
address_of_total : .word total					/*Address of Total Pay*/
address_of_pay1 : .word pay1					/*Address of Pay1*/
address_of_pay2 : .word pay2					/*Address of Pay2*/
address_of_pay3 : .word pay3					/*Address of Pay3*/
address_of_count : .word count					/*Address of count*/
address_of_hwork : .word hwork					/*Address of Hours Worked*/
address_of_wph : .word wph						/*Address of Wage Per Hour*/
address_of_return : .word return				/*Address of Return*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/

/* External */
.global printf
.global scanf
