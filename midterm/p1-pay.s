/*p1-pay.s File*/

.global _start1

.data

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 

.text
 
_start1:
	mov r0, #5
	bal main
	

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/


/* External */
.global printf
.global scanf
