/* -- printf01.s */
.data
 
/* First message */
.balign 4
message1: .asciz "Actual Answer a/b = "
 
/* Second message */
.balign 4
message2: .asciz "Acutal Remainder a%b = "
 
/* Third message */
.balign 4
message3: .asciz "Calculated a/b = "

/* Fourth message */
.balign 4
message4: .asciz "Calculated a%b = "
 
/* Fifth message */
.balign 4
message5: .asciz "Input 'a' = "

/* Sixth message */
.balign 4
message6: .asciz "Input 'b' = "

/* Seventh message */
.balign 4
message7: .asciz "Input 'a' is = %d\n"

/* Eighth message */
.balign 4
message8: .asciz "Input 'b' is = %d\n"
 
/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d" 
 
/* Format pattern for 'a' */
.balign 4
scan_a : .asciz "%d"

/* Format pattern for 'b' */
.balign 4
scan_b : .asciz "%d"
 
/* Where scanf will store the number read */
.balign 4
number_a: .word 0

/* Where scanf will store the number read */
.balign 4
number_b: .word 0
 
.balign 4
return: .word 0
 
.text
 
.global main
main:
    ldr r1, address_of_return        /* r1 ← &address_of_return */
    str lr, [r1]                     /* *r1 ← lr */
 
	/*First Print*/
    ldr r0, address_of_message5      /* r0 ← &message5 */
    bl printf                        /* call to printf */
 
    ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_number_a   	/* r1 ← &number_read */
    bl scanf                        /* call to scanf */
 
    ldr r0, address_of_message7     /* r0 ← &message5 */
    ldr r1, address_of_number_a  	/* r1 ← &number_read */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	/*First Print End*/
 
	/*second print*/
    ldr r0, address_of_message6      /* r0 ← &message5 */
    bl printf                        /* call to printf */
 
    ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_number_b   	/* r1 ← &number_read */
    bl scanf                        /* call to scanf */
 
    ldr r0, address_of_message8     /* r0 ← &message5 */
    ldr r1, address_of_number_b  	/* r1 ← &number_read */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	/*second print end*/
  
	/*Divide*/
_div:
 	ldr R4, address_of_number_a		@ Number to divide / Will hold remainder.
	ldr R4, [R4]
	ldr R5, address_of_number_b		@ Number to divide by.
	ldr R5, [R5]
	MOV R6, #0						@ Number to hold times divided by value.
	
_sub:						@ Subtraction Happens HERE.
	SUBS R4, R4, R5
	BMI _exit				@ If Negative, branch to exit.

_add:						@ Increment R3 HERE
	ADD R6, R6, #1			@ Will Hold value of R4%R5
	BAL _sub				@ Always Branch to _sub

_exit:
	ADD R4, R4, R5			@ Corrects the extra subtraction done to R4
	ADD R0, R4, #0			@ Test: Shows R4/R5 without remainder
	@ ADD R0, R3, #0		@ Test: Shows R4%R5
	@MOV R7, #1				@ Prepare Software Interrupt 1: EXIT
	@SWI 0					@ Software Interrupt: Exit
 
 
 
 
 
	/*EXIT*/
    ldr r0, address_of_number_a		/* r0 ← &number_read */
    ldr r0, [r0]                    /* r0 ← *r0 */
 
    ldr lr, address_of_return       /* lr ← &address_of_return */
    ldr lr, [lr]                    /* lr ← *lr */
    bx lr                           /* return from main using lr */
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_message3 : .word message3
address_of_message4 : .word message4
address_of_message5 : .word message5
address_of_message6 : .word message6
address_of_message7 : .word message7
address_of_message8 : .word message8
address_of_scan_pattern : .word scan_pattern
address_of_scan_a : .word scan_a
address_of_scan_b : .word scan_b
address_of_number_a : .word number_a
address_of_number_b : .word number_b
address_of_return : .word return
 
/* External */
.global printf
.global scanf
