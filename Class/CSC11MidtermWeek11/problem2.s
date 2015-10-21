/* To Compile
	gcc problem2.s -o p1
	./p2
*/
.data
 
prompt2a:  .asciz "In problem # 2 Cable Bill Calculator \n"
prompt2b:  .asciz "Input Package (a,b,c) and hours (hrs) -> c 43 or b 24 or a 12 \n"
format2:   .asciz "%s %d"
message2a: .asciz "Package = %c  and hours = %d\n"
message2aa:.asciz "Package = %d  and hours = %d\n"
message2b: .asciz "Cable Bill = $%d\n"
answer:    .asciz " "
.balign 4
hrs: .skip 4

.text
.globl problem2
problem2:
    push {r4-r7,lr}              /* Push lr onto the top of the stack */
	
    ldr r0, ad_p2a               /* Set &prompt1a as the first parameter of printf */
    bl printf                    /* Call printf */
	
	ldr r0, ad_p2b               /* Set &prompt2a as the first parameter of printf */
    bl printf                    /* Call printf */
 
    ldr r0, ad_f2                /* Set format as the first parameter of scanf */
    ldr r2, ad_hrs               /* Set variable of the stack as b */
	ldr r1, ad_pkg               /* and second value as a of scanf */
    bl scanf                     /* Call scanf */
 
	ldr r1, ad_pkg               /* Load the char a read by scanf into r1 */
    ldr r2, ad_hrs		         /* Load the integer b read by scanf into r2 */
    ldr r1, [r1]                 /* Load the char a read by scanf into r1 */
    ldr r2, [r2]                 /* Load the integer b read by scanf into r2 */
    ldr r0, ad_m2a               /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	ldr r1, ad_pkg               /* Load the char a read by scanf into r1 */
    ldr r2, ad_hrs		         /* Load the integer b read by scanf into r2 */
    ldr r1, [r1]                 /* Load the char a read by scanf into r1 */
    ldr r2, [r2]                 /* Load the integer b read by scanf into r2 */
	
	/* Cable Bill calculations done below */
	   sub r3,r1,#96
	   sub r5,r1,#100
	   neg r5,r5
	   mov r7,#5
	   mul r1,r3,r7
	   add r1,r1,#25
	   mov r7,#11
	   mul r4,r3,r7
	   mov r6,#0
	   while:
            cmp r2,r4
			blt end
			cmp r6,#2
			bge end
			add r6,r6,#1
			sub r2,r2,r4
			mul r7,r2,r5
			add r1,r1,r7
			b while
		end:
	/* Cable Bill calculations done above */
	
	
    ldr r0, ad_m2b               /* Set &message3 as the first parameter of printf */
    bl printf                    /* Call printf */
 
    pop {r4-r7,lr}               /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
ad_p2a: .word prompt2a
ad_p2b: .word prompt2b
ad_f2:  .word format2
ad_m2a: .word message2a
ad_m2aa:.word message2aa
ad_m2b: .word message2b
ad_hrs: .word hrs
ad_pkg: .word answer
