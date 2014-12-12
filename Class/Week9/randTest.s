/* -- randTest.s */
.data
 
message: .asciz "The random function returned %d\n"
message1: .asciz "Guessing Game %d\n"
message2: .asciz "\nType a Number:" 
message3: .asciz "\nTOO HIGH: TRY AGAIN! %d TRYS LEFT" 
message4: .asciz "\nTOO LOW: TRY AGAIN! %d TRYS LEFT" 

rand: 	  .asciz "\nThe random number was: %d"
guessed:  .asciz "\n			You Typed: %d"

win:  	 .asciz "\n!!!YOU WIN!!!!"
lose:  	 .asciz "\n!!!YOU LOSE!!!"
 
.text

.global main
main:
    push {r4,lr}                 /* Push lr onto the top of the stack */

	mov r0,#0                    /* Set time(0) */
    bl time                      /* Call time */
	bl srand                     /* Call srand */
	
	mov r4,#0                    /* Setup loop counter */
	
  loop_rand:                     /* Create a 2 digit random number */
	bl rand                      /* Call rand */
	mov r1,r0,ASR #1             /* In case random return is negative */
	mov r2,#90                   /* Move 90 to r2 */
		                         /* We want rand()%90+10 so cal divMod with rand()%90 */
	bl divMod                    /* Call divMod function to get remainder */
	add r1,#10                   /* Remainder in r1 so add 10 giving between 10 and 99 -> 2 digits */
	
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
	
	add r4,#1
	cmp r4,#20
	blt loop_rand
	
    pop {r4,lr}                     /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */

/**/
address_of_message: .word message
address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_message4: .word message4

address_of_rand: .word rand
address_of_guessed: .word guessed

address_of_win: .word win
address_of_lose: .word lose

/*External Functions*/
.global printf
.global time
.global srand
.global rand
