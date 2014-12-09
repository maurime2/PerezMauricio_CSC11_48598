/*
	Dr. Mark E. Lehr
	Sept 16th, 2014
	Purpose:  Inefficient technique for calculating a/b and a%b
	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
	flag -> r4 to reverse contents of r0 and r1
	
	Assignment 3 - 09/29/14   
	Div Mod Completed
	
	Modified by Mauricio S. Perez
	This revised version of Divmod allows the user to input values
	it also outputs the final amounts of A/B and A%B
	This is done so it can be used as a function in future programs.
 */
 
 .data
/* Prompt */
.balign 4
prmt0: .asciz "Scan in Number number: "
.balign 4
prmt1: .asciz "Number 1: %d\n"
.balign 4
prmt2: .asciz "Number 2: %d\n"
.balign 4
prmt3: .asciz "A/B= %d "
.balign 4
prmt4: .asciz "A%B= %d"
.balign 4
prmt5: .asciz "Number: %d"

NumA: .word 0	/*A*/
NumB: .word 0	/*B*/


/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 
 
.text
.global main
main:
	/* Initialize */
	mov r2, #111     /* a=111 */
	mov r3, #5       /* b=5 */
	
	/*Print Values that were Initialized*/
	ldr r0, address_of_NumA
	str r2, [r0]
	ldr r0, address_of_NumB
	str r3, [r0]

	/*Relode Initialized Values*/
	ldr r2, address_of_NumA
	ldr r2, [r2]
	
	ldr r0, address_of_prmt1	     /* Prompt for Hours */
	mov r1, r2
    bl printf                       /* call to printf */

	ldr r3, address_of_NumB
	ldr r3, [r3]
	
	ldr r0, address_of_prmt1	     /* Prompt for Hours */
	mov r1, r3
    bl printf                       /* call to printf */
	
	/*Relode Initialized Values*/
	ldr r2, address_of_NumA
	ldr r2, [r2]
	ldr r3, address_of_NumB
	ldr r3, [r3]
	
	mov r0, #0       /* r0=0 -> counter */
	mov r1, r2       /* r1=a=111 */
	mov r4, #0       /* if 1 swap r0 and r1 on exit else 0*/

	/* Check condition where a<b then a%b=a a/b=0 */
	cmp  r1, r3      /* compare and leave if less */
	blt  swap
	/* Now just perform repeated subtractions */

repeat_subtraction:
	add r0, r0, #1   /* increment r0 */
	sub r1, r1, r3   /* r1=r1-r3 */
	cmp r1, r3       /* Note: subs won't work above need cmp!!! */
	bge repeat_subtraction       /* repeat the subtraction */

swap:
	/* Exchange r0 and r1 using r5 with a swap if flag set */
	cmp r4, #0
	beq end;
	mov r5, r0
	mov r0, r1
	mov r1, r5
end:
	bx lr
	
	/*Exit*/
	MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	SWI 0
	
/*Messages*/
address_of_prmt0 : .word prmt0					/*"Problem Chosen %d"*/
address_of_prmt1 : .word prmt1					/*"Problem Chosen %d"*/
address_of_prmt2 : .word prmt2					/*"Problem Chosen %d"*/
address_of_prmt3 : .word prmt3					/*"Problem Chosen %d"*/
address_of_prmt4 : .word prmt4					/*"Problem Chosen %d"*/
address_of_prmt5 : .word prmt5					/*"Problem Chosen %d"*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/

address_of_NumA : .word NumA					/*Address of peg1: Code to Break*/
address_of_NumB : .word NumB					/*Address of peg1: Code to Break*/

	
/* External */
.global printf
.global scanf
