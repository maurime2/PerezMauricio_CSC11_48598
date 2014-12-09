/*scaleLeft.s File
Mauricio S. Perez
Midterm: CSC11-48598
scaleLeft
*/

.global _scaleLeft

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
 
_scaleLeft:
	
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
