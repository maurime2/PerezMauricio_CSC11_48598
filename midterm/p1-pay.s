/*p1-pay.s File*/

.global _start1



.data
.text
 
_start1:
	mov r0, #5
	bal main
	

/*Messages*/
	
/* External */
.global printf
.global scanf