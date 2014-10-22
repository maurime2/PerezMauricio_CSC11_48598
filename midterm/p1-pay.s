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

/* Select 0 */
.balign 8
select0: .asciz "Error: Please Try Again\n"

/* Select 1 */
.balign 8
select1: .asciz "Straight Time(1-20 Hrs): $ 8 An Hour for %d Hrs = %d\n"

/* Select 2 */
.balign 8
select2: .asciz "Double Time (21-40 Hrs): $16 An Hour for %d Hrs = %d\n"

/* Select 3 */
.balign 8
select3: .asciz "Triple Time (41-60 Hrs): $24 An Hour for %d Hrs = %d\n"

/* Select 4 */
.balign 4
select4: .asciz "Total Pay: %d Hrs = %d Dollars \n"

/* Hours Worked */
.balign 4
hwork: .asciz "Hours Worked: %d\n"

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
pay1: .word 8

/* Pay2 */
.balign 4
pay2: .word 16

/* Pay3 */
.balign 4
pay3: .word 24

/* count */
.balign 4
count: .word 20

/*Return*/
.balign 4
return: .word 0

.text
 
_start1:
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
	
_h1:
	/*Set Up for Straight Time*/
	mov r2, #0						/*Holds Total pay for class amount*/
	mov r1, #0						/*Holds count for total hours worked(of each class)*/
	ldr r4, address_of_hours		/*Holds address of total hours (all hours)*/
	ldr r4, [r4]					/*Holds total hours (all hours)*/
	ldr r5, address_of_hwork		/*Holds address of hours worked for class (For save and print)*/
	cmp r4, #0         				/* compare r4 and 0 */
    beq _pre						/* if r0 != 2 then branch */
	
_h1c:
	/*Calculate Straight Time*/
	
	
_pr1:
	/*Print Straight Hours*/
	ldr r0, address_of_select1     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
	ldr r2, address_of_pay1	  		/* r1 ← &choice */
    ldr r2, [r2]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	
_pr2:
	/*Print Double Hours*/
	ldr r0, address_of_select2     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
	ldr r2, address_of_pay2	  		/* r1 ← &choice */
    ldr r2, [r2]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */

_pr3:
	/*Print Triple Hours*/
	ldr r0, address_of_select3     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
	ldr r2, address_of_pay3	  		/* r1 ← &choice */
    ldr r2, [r2]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */


_pre:
	/*Print Error*/
	ldr r0, address_of_select0     	/* r0 ← &Problem Selected */
    ldr r1, address_of_hours	  	/* r1 ← &choice */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */	
	b _start1						/*Branch Back to Start*/

	/*Return to main*/
_ret:
	bal main						@ Branch to Main and output Problem Select

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_select : .word select				/*"Select a Problem:"*/
address_of_select0 : .word select0				/*"Problem 0: Error "*/
address_of_select1 : .word select1				/*"Problem 1: "*/
address_of_select2 : .word select2				/*"Problem 2: "*/
address_of_select3 : .word select3				/*"Problem 3: "*/
address_of_select4 : .word select4				/*"End Prompt"*/
address_of_hours : .word hours					/*Address of Hours*/
address_of_total : .word total					/*Address of Total Pay*/
address_of_pay1 : .word pay1					/*Address of Pay1*/
address_of_pay2 : .word pay2					/*Address of Pay2*/
address_of_pay3 : .word pay3					/*Address of Pay3*/
address_of_count : .word count					/*Address of count*/
address_of_hwork : .word hwork				/*Address of Hours Worked*/
address_of_return : .word return				/*Address of Return*/

/* External */
.global printf
.global scanf
