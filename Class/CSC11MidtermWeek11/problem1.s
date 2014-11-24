/* To Compile
	gcc problem1.s -o p1
	./p1
*/
.data
 
prompt1a:  .asciz "In problem # 1 PayCheck Calculator \n"
prompt1b:  .asciz "Input hours worked (hrs) and rate of pay ($s/hr)\n"
format1:   .asciz "%d %d"
message1a: .asciz "Hours worked = %d (hrs) and rate of pay = $%d\n"
message1b: .asciz "Pay Check = $%d\n"
 
.text
.globl problem1
problem1:
    push {r4,lr}                 /* str lr, [sp,#-4]! Push lr onto the top of the stack */
    sub sp, sp, #8               /* Make room for two 4 byte integers in the stack */
	
    ldr r0, ad_p1a               /* Set &prompt1a as the first parameter of printf */
    bl printf                    /* Call printf */
	
	ldr r0, ad_p1b               /* Set &prompt2a as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, ad_f1                /* Set format as the first parameter of scanf */
    mov r2, sp                   /* Set variable of the stack as b */
	add r1, r2, #4               /* and second value as a of scanf */
    bl scanf                     /* Call scanf */
 
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
    ldr r0, ad_m1a               /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	add r1, sp, #4               /* Place sp+4 -> r1 */
    ldr r1, [r1]                 /* Load the integer a read by scanf into r1 */
    ldr r2, [sp]		         /* Load the integer b read by scanf into r2 */
	
	/* Payroll calculations done below */
	mov r3, #0
	do_While_r1_gt_0:
		mul r4,r1,r2;
		add r3,r3,r4
        sub r1,r1,#20;
		cmp r1,#0
    bgt do_While_r1_gt_0
	/* Payroll calculations done above */
		
	mov r1,r3					 /* returns r3 -> need move to r1 for printf */
    ldr r0, ad_m1b               /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    add sp, sp, #8               /* Discard the integer read by scanf */
    pop {r4,lr}                  /* ldr lr, [sp], #+4 Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
ad_p1a: .word prompt1a
ad_p1b: .word prompt1b
ad_f1:  .word format1
ad_m1a: .word message1a
ad_m1b: .word message1b
