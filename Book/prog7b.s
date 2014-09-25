/*How to use syscall 3 to read from keyboard*/

	.global _start
_start:
_read:
					@ Read syscall
	MOV R7, #3		@ Syscall number
	MOV R0, #0		@ Stdout is monitor
	MOV R2, #5		@ string is 19 chars long (HAS TO BE THE EXACT LENGTH OF "string")
	LDR R1,=string	@ string located at string
	SWI 0
	
_write:
					@ Write Syscall
	MOV R7, #4		@ Syscall number
	MOV R0, #1		@ stdout is monitor
	MOV R2, #19		@ string is 19 chars long
	LDR R1,=string	@ string located at start:
	SWI 0
	
_exit:
	@ exit syscall
	MOV R7, #1
	SWI 0
	
.data
string:
.ascii "Hello World String\n"
