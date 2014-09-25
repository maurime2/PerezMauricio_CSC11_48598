/**/

	.global _start
_start:

	MOV R7, #4		@ Syscall number
	MOV R0, #1		@ Stdout is monitor
	MOV R2, #19		@ string is 19 chars long (HAS TO BE THE EXACT LENGTH OF "string")
	LDR R1,=string	@ string located at string
	SWI 0
	
_exit:

	MOV R7, #1
	SWI 0
	
.data
string:
.ascii "Hello World String\n"
