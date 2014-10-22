/*p1-pay.s File*/

.global _start1

.data
/* Select Message */
.balign 4
select: .asciz "Input Total Hours Worked (Max 60): "

/* Select 1 */
.balign 4
select1: .asciz "0-20 Hours - Straight time: $8 An Hour\n"

/* Select 2 */
.balign 4
select2: .asciz "21-40 Hours - Straight Time: $16 An Hour\n"

/* Select 3 */
.balign 4
select3: .asciz "41-60 Hours - Triple Time: $24 An Hour\n"

/* Select 4 */
.balign 4
select4: .asciz "Midterm Complete!!! \n"

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

/* Hours */
.balign 4
hours: .word 0

/*Return*/
.balign 4
return: .word 0

.text
 
_start1:
	str lr, [sp]					/*Link Register into Stack Pointer*/
	/*Print*/
	ldr r1, address_of_return       /* r1 ? &address_of_return */
    str lr, [r1]                    /* *r1 ? lr */

    ldr r0, address_of_select     	/* Load Address of Select */
    bl printf                       /* call to printf */
	
	/*Scan Choice*/
	ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_hours   	/* r1 ← &number_a */
    bl scanf                        /* call to scanf */
	bal main						@ Branch to Main and output Problem Select
	

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_select : .word select				/*"Select a Problem:"*/
address_of_select1 : .word select1				/*"Problem 1: "*/
address_of_select2 : .word select2				/*"Problem 2: "*/
address_of_select3 : .word select3				/*"Problem 3: "*/
address_of_select4 : .word select4				/*"End Prompt"*/
address_of_hours : .word hours					/*Address of Hours*/
address_of_return : .word return				/*Address of Return*/

/* External */
.global printf
.global scanf
