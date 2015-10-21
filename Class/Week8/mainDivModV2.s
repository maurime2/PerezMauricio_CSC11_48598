/* To Compile
	gcc -c mainDivModFuncV2.s
	gcc -c mainDivModV2.s
	gcc mainDivModFuncV2.o mainDivModV2.o -o divMod
	./factorial
*/
.data
 
message1: .asciz "Type 2 numbers a and b for a/b and a%b: "
format:   .asciz "%d %d"
message2: .asciz "The inputs are a = %d is b = %d\n"
message3: .asciz "The outputs are a div b = %d and a mod b = %d\n"
 
.text
.globl main
main:
    str lr, [sp,#-4]!            /* Push lr onto the top of the stack */
    sub sp, sp, #8               /* Make room for two 4 byte integers in the stack */
	
    ldr r0, address_of_message1  /* Set &message1 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, address_of_format    /* Set format as the first parameter of scanf */
    mov r2, sp                   /* Set variable of the stack as b */
	add r1, r2, #4               /* and second value as a of scanf */
    bl scanf                     /* Call scanf */
 
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
    ldr r0, address_of_message2  /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
	bl divMod
	mov r2,r1					 /* divMod returns r0,r1 -> need r1,r2 for printf */
	mov r1,r0
    ldr r0, address_of_message3  /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    add sp, sp, #8               /* Discard the integer read by scanf */
    ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_format:   .word format
