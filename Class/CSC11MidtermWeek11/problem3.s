/* To Compile
	gcc problem3.s -o p3
	./p3
*/
.data
 
prompt3a:  .asciz "In problem # 3 Fibonacci Calculator \n"
prompt3b:  .asciz "Input Fibonacci term to calculate\n"
format3:   .asciz "%d"
message3a: .asciz "Your input was = %d for the Fibonacci term\n"
message3b: .asciz "The Fibonacci sequence result = %d\n"
 
.text
.globl problem3
problem3:
    push {r4-r5,lr}              /* str lr, [sp,#-4]! Push lr onto the top of the stack */
    sub sp, sp, #4               /* Make room for 4 byte integer in the stack */
	
    ldr r0, ad_p3a               /* Set &prompta as the first parameter of printf */
    bl printf                    /* Call printf */
	
	ldr r0, ad_p3b               /* Set &promptb as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, ad_f3                /* Set format as the first parameter of scanf */
    mov r1, sp                   /* Set variable of the stack as a */
    bl scanf                     /* Call scanf */
 
    ldr r1, [sp]		         /* Load the integer b read by scanf into r1 */
    ldr r0, ad_m3a               /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
    ldr r1, [sp]		         /* Load the integer a read by scanf into r1 */
	
	/* Fibonacci calculations done below */
	mov r2, #0
	mov r3, #1
	mov r4, #2
	mov r5, r1
	cmp r5, #1
	mov r1,r2
	ble end3
	cmp r5, #2
	mov r1, r3
	ble end3
	do_While_r4_lt_r5:
		add r1,r2,r3
		mov r3,r2
        mov r2,r1
		add r4,r4,#1
		cmp r4,r5
    ble do_While_r4_lt_r5
	/* Fibonacci calculations done above */
	
	end3:
    ldr r0, ad_m3b               /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    add sp, sp, #4               /* Discard the integer read by scanf */
    pop {r4-r5,lr}               /* ldr lr, [sp], #+4 Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
ad_p3a: .word prompt3a
ad_p3b: .word prompt3b
ad_f3:  .word format3
ad_m3a: .word message3a
ad_m3b: .word message3b
