factorial:
    str lr, [sp,#-4]!  /* Push lr onto the top of the stack */
    str r4, [sp,#-4]!  /* Push r4 onto the top of the stack */
                       /* The stack is now 8 byte aligned */
    mov r4, r0         /* Keep a copy of the initial value of r0 in r4 */
 
 
    cmp r0, #0         /* compare r0 and 0 */
    bne is_nonzero     /* if r0 != 0 then branch */
    mov r0, #1         /* r0 ← 1. This is the return */
    b end
is_nonzero:
                       /* Prepare the call to factorial(n-1) */
    sub r0, r0, #1     /* r0 ← r0 - 1 */
    bl factorial
                       /* After the call r0 contains factorial(n-1) */
                       /* Load initial value of r0 (that we kept in r4) into r1 */
    mov r1, r4         /* r1 ← r4 */
    mul r0, r0, r1     /* r0 ← r0 * r1 */
 
end:
    ldr r4, [sp], #+4  /* Pop the top of the stack and put it in r4 */
    ldr lr, [sp], #+4  /* Pop the top of the stack and put it in lr */
    bx lr              /* Leave factorial */