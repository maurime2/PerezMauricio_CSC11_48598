/*p1-pay.s File*/

.global _start

_start:
	mov r0, #5
	MOV R7, #1
	SWI 0
	