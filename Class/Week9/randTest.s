/* -- randTest.s */
.data
numRan: .word 0 
numGue: .word 0 
trys: .word 20 
scan_pattern : .asciz "%d"
message:  .asciz "The random function returned %d\n"
message1: .asciz "\n\n!!!Guessing Game!!!\n"
message0: .asciz "\nHow many TRYS would you like?: "
message2: .asciz "\nType a Number:" 
message3: .asciz "\nTOO HIGH: TRY AGAIN! %d TRYS LEFT" 
message4: .asciz "\nTOO LOW: TRY AGAIN! %d TRYS LEFT"
message5: .asciz "\nYOU REALY WANNA KNOW??? ITS %d YA CHEATER!!!!" 

randomN:  .asciz "\nThe random number was: %d"
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
	
/*Store Random Number*/	
_sav:	ldr r0, address_of_randomN
		str r1, [r0]
	
/*CHECK AND MODIFY Random Number to be between 0 and 1000*/	
	ldr r1, address_of_randomN		/*Load random number into r1*/
	ldr r1, [r1]
	CMP r1, #1000					/*Compare will check if its between 0 and 1000*/
	ble _game
		/*Correct Number*/
_clr:	mov r0, #0
_corr:	add r0, r0, #1
		cmp r1, #1000
		beq _clr
			sub r1, r1, #1
			cmp r1, #1000
			bgt _corr
	
	/*Store Random Number*/	
		ldr r1, address_of_randomN
		str r0, [r1]
	
	/*Load Random Number*/
	ldr r1, address_of_randomN
	ldr r1, [r1]
/*GAME START*/	
_game:	ldr r0, address_of_message1		/*Prompt Game*/
		bl printf
		
		/*Prompt for trys*/
		ldr r0, address_of_message0		/*Prompt Game*/
		bl printf
		
		/*Scan Trys*/
		ldr r0, address_of_scan_pattern	/* r0 ← &Scan pattern */
		ldr r1, address_of_trys  		/* r1 ← &trys */
		bl scanf 
 
 
_high:	/*Prompt too High*/
		ldr r0, address_of_message3		/*Prompt Game*/
		ldr r1, address_of_trys
		ldr r1, [r1]
		bl printf

_low:	/*Prompt too low*/
		ldr r0, address_of_message4		/*Prompt Game*/
		ldr r1, address_of_trys
		ldr r1, [r1]
		bl printf
 
_endg:   pop {r4,lr}                     /* Pop the top of the stack and put it in lr */
		bx lr                        	/* Leave main */
 
address_of_message: .word message
address_of_message1: .word message1
address_of_message0: .word message0
address_of_message2: .word message2
address_of_message3: .word message3
address_of_message4: .word message4
address_of_message5: .word message5
address_of_trys: .word trys
address_of_randomN: .word randomN
address_of_guessed: .word guessed

address_of_win: 		.word win
address_of_lose: 		.word lose
address_of_numRan:		.word numRan
address_of_numGue:		.word numGue
address_of_scan_pattern:.word scan_pattern

/*External Functions*/
.global printf
.global time
.global srand
.global rand
