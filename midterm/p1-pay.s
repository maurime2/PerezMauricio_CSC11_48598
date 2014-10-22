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

.text
 
_start1:
	mov r0, #5
	bal main
	

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_select : .word select				/*"Select a Problem:"*/
address_of_select1 : .word select1				/*"Problem 1: "*/
address_of_select2 : .word select2				/*"Problem 2: "*/
address_of_select3 : .word select3				/*"Problem 3: "*/
address_of_select4 : .word select4				/*"End Prompt"*/

/* External */
.global printf
.global scanf
