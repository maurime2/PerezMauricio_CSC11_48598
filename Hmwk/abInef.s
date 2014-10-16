/* -- abInef.s 									*/
/*By: Mauricio S. Perez							*/
/*Date Completed: 10.16.2014 12:40 AM.			*/
/*Divide program that asks user for two inputs.	*/
/*Input 'a' will be divided by Input 'b'.		*/
/*At the end, Program will print a/b and 		*/
/*				  show the remainder a%b.		*/

.data
 
/* First message */
.balign 4
message1: .asciz "Actual Answer a/b = %d\n"
 
/* Second message */
.balign 4
message2: .asciz "Acutal Remainder a%b = %d\n"
 
/* Third message */
.balign 4
message3: .asciz "Calculated a/b = %d\n"

/* Fourth message */
.balign 4
message4: .asciz "Calculated a%b = %d\n"
 
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
calc_a/b : .word 0

/* Format pattern for 'b' */
.balign 4
scan_a%b : .word 0
 
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
    ldr r1, address_of_number_a   	/* r1 ← &number_a */
    bl scanf                        /* call to scanf */
 
    ldr r0, address_of_message7     /* r0 ← &message7 */
    ldr r1, address_of_number_a  	/* r1 ← &number_a */
    ldr r1, [r1]                    /* r1 ← *r1 */
    bl printf                       /* call to printf */
	/*First Print End*/
 
	/*second print*/
    ldr r0, address_of_message6      /* r0 ← &message6 */
    bl printf                        /* call to printf */
 
    ldr r0, address_of_scan_pattern	/* r0 ← &scan_pattern */
    ldr r1, address_of_number_b   	/* r1 ← &number_b */
    bl scanf                        /* call to scanf */
 
    ldr r0, address_of_message8     /* r0 ← &message8 */
    ldr r1, address_of_number_b  	/* r1 ← &number_b */
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
	/*Corrects Extra Subtraction*/
	ADD R4, R4, R5			@ Corrects the extra subtraction done to R4
	 
	/* a/b Print */
    ldr R0, address_of_message1      /* r0 ← &message5 */
	ADD R1, R6, #0
    bl printf                        /* call to printf */
	
	/* a%b Print */
    ldr r0, address_of_message2      /* r0 ← &message5 */
    ADD R1, R4, #0
	bl printf                        /* call to printf */
	
	/*Store R6 (Div) in addresses*/
	ldr r1, address_of_a/b			/* Stores a/b to address */
	str r6, [r1]
	
	/*R4 (Remainder) in addresses*/
	ldr R1, address_of_a%b			/* Stores a%b to address */
	str R4, [r1]
 
	/*EXIT*/
    @ldr r0, address_of_number_a		/* r0 ← &number_read */
    @ldr r0, [r0]                    /* r0 ← *r0 */
 
	/*Echo Register Tests*/
	ADD R0, R6, #0			@ Test: Shows R4/R5 without remainder
	@ ADD R0, R4, #0		@ Test: Shows R4%R5

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
address_of_a/b : .word calc_a/b
address_of_a%b : .word scan_a%b
address_of_number_a : .word number_a
address_of_number_b : .word number_b
address_of_return : .word return
 
/* External */
.global printf
.global scanf
