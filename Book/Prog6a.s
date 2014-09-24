/*Preform R0=r1+r2*/

	.global _start
_start:
	MOV R1, #50		/*Get 50 into R1*/
	MOV R2, #60		/*Get 60 into R2*/
	ADDs R0, R1, R2	/*Add the two into r2*/
	
	MOV R7, #1	/*exit through system call.*/
	SWI 0
