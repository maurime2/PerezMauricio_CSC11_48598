/*mastermind Project 1*/

.global _mastermind

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d"

/* Address of return */
.balign 4
return: .word 0 

.data

/* Pegs */
.balign 4
peg0: .word 0	/*code peg 1*/
peg1: .word 1	/*code peg 1*/
peg2: .word 2	/*code peg 2*/
peg3: .word 3	/*code peg 3*/
peg4: .word 4	/*code peg 4*/
peg5: .word 5	/*code peg 5*/
peg6: .word 6	/*code peg 6*/
peg7: .word 7	/*code peg 7*/
peg8: .word 8	/*code peg 8*/
pegT0: .word 0	/*code peg TEMPORARY 0*/
pegT1: .word 0	/*code peg TEMPORARY 1*/
pegT2: .word 0	/*code peg TEMPORARY 2*/
pegT3: .word 0	/*code peg TEMPORARY 3*/
pegT4: .word 0	/*code peg TEMPORARY 4*/
count: .word 0	/*Count of Pegs*/
trys: .word 12	/*Trys Left*/
place: .word 0	/*Count of Guesses of right place and colors*/
color: .word 0	/*Count of Guesses of right colors, wrong place*/
again: .word 0	/*1 = Play Again when asked*/

/* Prompt */
	.balign 8
	prompt: .asciz "CODEMAKER: Pick a Value for Peg %d (1-6): "
/*PROMPTS: CODEMAKER PRINT */
		.balign 8
	code: .asciz "CODEMAKER: Your CODE is: <%d%d%d"
		.balign 8
	code2: .asciz "%d>\n"

/*PROMPTS: PLAYER PRINT */
		.balign 8
	prompt2: .asciz "PLAYER: Pick a Value for Peg %d (1-6): "
		.balign 8
	code3: .asciz "PLAYER: Your CODE is: <%d%d%d"
		.balign 8
	code4: .asciz "%d>\n"
	
/*PROMPT: Play Again */
		.balign 8
	againp: .asciz "Play Again? [1] for YES, else for NO "

/*PROMPT: Type anything to continue*/
		.balign 8
	cont: .asciz "Type ANY NUMBER to Clear Screen..."
		.balign 8
	cont2: .asciz "Type ANY NUMBER to Print Board..."
/*PRINTS: HIT and SPACE*/
		.balign 8
	hit: .asciz 	"*"	/*HIT*/
	space: .asciz 	" "	/*SPACE*/
/* ERROR: RETRY INPUT*/
		.balign 8
	error: .asciz "Error, Value must be within (1-6), Try Again\n"
/* Divider */
		.balign 8
	divider: .asciz "--------------------------------------\n"
/*Screen Clear*/
		.balign 8
	sclear: .asciz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
/*PROMPTS: Board Print*/
		.balign 8
	board1: .asciz "[Exact][Color]__________%d Trys Left!\n"
		/*EXACT PEG PRINT*/
		.balign 8
	board2: .asciz "| "
		.balign 8
	board3: .asciz "|"
		/*Color match PEG PRINT*/
		.balign 8
	board4: .asciz "| %d%d%d"
		.balign 8
	board5: .asciz "%d|"
		/*Code Inputed by user*/
		.balign 8
	board6: .asciz " %d-%d-%d-"
		.balign 8
	board7: .asciz "%d |/n"
/*PROMPTS: YOU WIN*/
		.balign 8
	match: .asciz "ALL MATCH !!!YOU WIN!!!"
		.balign 8
	nomatch: .asciz "NO MATCH -You Lose-"
		
.text

_mastermind:
/****************************************************************************************/
/*							CODEMAKER INPUTS CODE										*/
/****************************************************************************************/	
/*Prompt CODEMAKER for Peg values*/
	
	/*Print Bar*/
	ldr r0, address_of_divider     	/* PRINT DIVIDER 						*/
    bl printf    

	/*CODEMKER INPUT START*/
	ldr r5, address_of_count	 /*Count Will be used to keep track    */
	mov r1, #1					/* 	of sequence of inputs by CODEMAKER*/
	str r1, [r5]

	_p1s:
		/*Address peg1*/
		ldr r0, address_of_prompt
		ldr r1, address_of_count
		ldr r1, [r1]
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern	/* r0 ← &Scan pattern */
		ldr r1, address_of_peg1   		/* r1 ← &peg1 */
		bl scanf                        /* call to scanf */

		ldr r4, address_of_peg1	
		ldr r4, [r4]
		cmp r4, #0
		ble _err1
		cmp r4, #6
		ble _p2s
		b _err1
	
	_p2s:
		/*Print Bar*/
		ldr r0, address_of_divider     	/* PRINT DIVIDER 						*/
		bl printf
	
		ldr r5, address_of_count	 /*Count Will be used to keep track    */
		mov r1, #2					/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern	/* r0 ← &Scan pattern */
		ldr r1, address_of_peg2   		/* r1 ← &peg 2 */
		bl scanf                        /* call to scanf */
		
		ldr r4, address_of_peg2
		ldr r4, [r4]
		cmp r4, #0
		ble _err2
		cmp r4, #6
		ble _p3s
		b _err2
	
	_p3s:
		/*Print Bar*/
		ldr r0, address_of_divider     	/* PRINT DIVIDER 						*/
		bl printf

		ldr r5, address_of_count	 /*Count Will be used to keep track    */
		mov r1, #3					/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern	/* r0 ← &Scan pattern */
		ldr r1, address_of_peg3   		/* r1 ← &peg3 */
		bl scanf                        /* call to scanf */
		
		ldr r4, address_of_peg3
		ldr r4, [r4]
		cmp r4, #0
		ble _err3
		cmp r4, #6
		ble _p4s
		b _err3

	_p4s:
		/*Print Bar*/
		ldr r0, address_of_divider     	/* PRINT DIVIDER 						*/
		bl printf
	
		ldr r5, address_of_count	 /*Count Will be used to keep track    */
		mov r1, #4					/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern	/* r0 ← &Scan Pattern */
		ldr r1, address_of_peg4   		/* r1 ← &Peg4 */
		bl scanf                        /* call to scanf */
		
		ldr r4, address_of_peg4
		ldr r4, [r4]
		cmp r4, #0
		ble _err4
		cmp r4, #6
		ble _code
		b _err4

	_code:
		/*Print Final Code*/
		ldr r0, address_of_divider     	/* PRINT DIVIDER 						*/
		bl printf
	
		ldr r0, address_of_code
		ldr r1, address_of_peg1
		ldr r1, [r1]
		ldr r2, address_of_peg2
		ldr r2, [r2]
		ldr r3, address_of_peg3
		ldr r3, [r3]
		bl printf
	
		ldr r0, address_of_code2
		ldr r1, address_of_peg4
		ldr r1, [r1]
		bl printf
		b _cont
	
	_cont:	
		/*Prompt: Type anything to continue*/
		ldr r0, address_of_cont
		bl printf
	
		/*Scan Anything*/
		ldr r0, address_of_scan_pattern				/* r0 ← &Scan pattern */
		ldr r1, address_of_peg0   					/* r1 ← &peg 5 TEMP */
		bl scanf                       				/* call to scanf */
		
	_clear:
		ldr r0, address_of_sclear					/* r0 ← &12 RETURNS (/n) */
		bl printf
		ldr r1, address_of_trys						/*Reset Trys*/
		mov r2, #12
		str r2, [r1]
_trys:	b _p5s
		
/****************************************************************************************/
/*								PLAYER INPUTS Guesses									*/
/****************************************************************************************/
_p5s:	/*Clear Count*/
		ldr r1, address_of_count
		mov r2, #1
		str r2, [r1]
		
		/*Address peg1*/
		ldr r0, address_of_prompt2
		ldr r1, address_of_count
		ldr r1, [r1]
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern			/* r0 ← &Scan pattern */
		ldr r1, address_of_peg5   				/* r1 ← &peg1 */
		bl scanf                        		/* call to scanf */

		ldr r4, address_of_peg5	
		ldr r4, [r4]
		cmp r4, #0
		ble _err5
		cmp r4, #6
		ble _p6s
		b _err5
	
	_p6s:
		/*Print Bar*/
		ldr r0, address_of_divider    		 	/* PRINT DIVIDER 						*/
		bl printf
	
		ldr r5, address_of_count			 /*Count Will be used to keep track    */
		mov r1, #2							/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt2
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern			/* r0 ← &Scan pattern */
		ldr r1, address_of_peg6   				/* r1 ← &peg 2 */
		bl scanf                       			/* call to scanf */
		
		ldr r4, address_of_peg6
		ldr r4, [r4]
		cmp r4, #0
		ble _err6
		cmp r4, #6
		ble _p7s
		b _err6
	
	_p7s:
		/*Print Bar*/
		ldr r0, address_of_divider     				/* PRINT DIVIDER 						*/
		bl printf

		ldr r5, address_of_count				 /*Count Will be used to keep track    */
		mov r1, #3								/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt2
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern			/* r0 ← &Scan pattern */
		ldr r1, address_of_peg7   				/* r1 ← &peg3 */
		bl scanf                        		/* call to scanf */
		
		ldr r4, address_of_peg7
		ldr r4, [r4]
		cmp r4, #0
		ble _err7
		cmp r4, #6
		ble _p8s
		b _err7

	_p8s:
		/*Print Bar*/
		ldr r0, address_of_divider     						/* PRINT DIVIDER */
		bl printf
	
		ldr r5, address_of_count	 						/*Count Will be used to keep track    */
		mov r1, #4											/* 	of sequence of inputs by CODEMAKER*/
		str r1, [r5]
	
		/*Address peg1*/
		ldr r0, address_of_prompt2
		bl printf	

		/*Scan Peg1*/
		ldr r0, address_of_scan_pattern						/* r0 ← &Scan Pattern */
		ldr r1, address_of_peg8   							/* r1 ← &Peg4 */
		bl scanf                        					/* call to scanf */
		
		ldr r4, address_of_peg8
		ldr r4, [r4]
		cmp r4, #0
		ble _err8
		cmp r4, #6
		ble _code2
		b _err8
	
		_code2:
		/*Print Final Code*/
		ldr r0, address_of_divider     						/* PRINT DIVIDER */
		bl printf
	
		ldr r0, address_of_code3
		ldr r1, address_of_peg5
		ldr r1, [r1]
		ldr r2, address_of_peg6
		ldr r2, [r2]
		ldr r3, address_of_peg7
		ldr r3, [r3]
		bl printf
	
		ldr r0, address_of_code4
		ldr r1, address_of_peg8
		ldr r1, [r1]
		bl printf
		b _cont2
	
		_cont2:	
		/*Prompt: Type anything to continue*/					/*Type any number to cont*/
		ldr r0, address_of_cont2
		bl printf
	
		/*Scan Anything*/
		ldr r0, address_of_scan_pattern							/* r0 ← &Scan pattern */
		ldr r1, address_of_peg0   								/* r1 ← &peg 5 TEMP */
		bl scanf                        						/* call to scanf */
		
	_clear2:
		ldr r0, address_of_sclear								/* r0 ← &12 RETURNS (/n) */
		bl printf
		
/****************************************************************************************/
/*					COMPARE Pegs and Print Board: EXACT PEGS							*/
/****************************************************************************************/
		ldr r2, address_of_trys		/* RESETS the number of tries, will be moved later*/
		ldr r1, [r2]
		sub r1, r1, #1
		str r1, [r2]
		
		ldr r1, address_of_trys		/* RESETS the number of tries, will be moved later*/
		ldr r1, [r1]
		ldr r0, address_of_board1
		bl printf
		
_addP1:
		ldr r1, address_of_peg1
		ldr r1, [r1]
		ldr r2, address_of_peg5
		ldr r2, [r2]
		cmp r1, r2
		beq _add_1
		b	_addP2
	_add_1:	add r4, r4, #1
_addP2:
		ldr r1, address_of_peg2
		ldr r1, [r1]
		ldr r2, address_of_peg6
		ldr r2, [r2]
		cmp r1, r2
		beq _add_2
		b	_addP3
	_add_2:	add r4, r4, #1
_addP3:
		ldr r1, address_of_peg3
		ldr r1, [r1]
		ldr r2, address_of_peg7
		ldr r2, [r2]
		cmp r1, r2
		beq _add_3
		b	_addP4
	_add_3:	add r4, r4, #1		
_addP4:
		ldr r1, address_of_peg4
		ldr r1, [r1]
		ldr r2, address_of_peg8
		ldr r2, [r2]
		cmp r1, r2
		beq _add_4
		b	_store_e_1					/*THIS LINE GOES TO PRINT ZERO*/
	_add_4:	add r4, r4, #1		

	_store_e_1:
			ldr r1, address_of_place	  /*STORES THE CORRECT NUMBER OF PLACES GUESSED:     */
			str r4, [r1]				 /*Address of place will also store # of right pegs */
			ldr r0, address_of_board2	/*Prints first part of the correct guess bracket   */
			bl printf
	
_printb1:							  /*Based on count of Correct Pegs in Correct spots,		  */
		ldr r1, address_of_place	 /*_printb1 is responsible for comparing correct pin guesses,*/	
		ldr r1, [r1]				/*If its 4 correct pins, _printP4 will be called out, 		*/
		cmp r1, #1					/*If its 3 correct pins, _printP3 will be called out, etc..*/
		beq _printP1
		cmp r1, #2
		beq _printP2
		cmp r1, #3
		beq _printP3
		cmp r1, #4
		beq _printP4
		b _printP0
	_printP4:								/*Prints 4 "*"* as a correct guess*/
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_board3
			bl printf
			b _wSpace
	_printP3:											/*Prints 3 "*"* as a correct guess with 1 space*/
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_board3
			bl printf
			b _wSpace
	_printP2:												/*Prints 2 "*"* as a correct guess with 2 space*/
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_board3
			bl printf
			b _wSpace
	_printP1:												/*Prints 1 "*"* as a correct guess with 3 space*/
			ldr r0, address_of_hit
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_board3
			bl printf
			b _wSpace
	_printP0:												/*Prints Spaces, None were guessed correctly*/
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_space
			bl printf
			ldr r0, address_of_board3
			bl printf
			b _wSpace
		
/****************************************************************************************/
/*					COMPARE Pegs and Print Board: Wrong Place, Right Color  PEGS		*/
/****************************************************************************************/	
		
_wSpace:					/*With Spaces: Logic will print out pegs that are in the wrong spot but*/
		
		
		bl _again
		
		mov r5, #0			/*are the right colour. */
		ldr r0, address_of_board2
		bl printf
		
		/*Temp Pegs*/							/*loads guessers Pegs to Temporary pegs. These will be used to find the wrong placed pegs*/
		ldr r0, address_of_pegT1	/**/
		ldr r1, address_of_peg5		/**/
		ldr r1, [r1]
		str r1, [r0]
		ldr r0, address_of_pegT2	/**/
		ldr r1, address_of_peg6		/**/
		ldr r1, [r1]
		str r1, [r0]
		ldr r0, address_of_pegT3	/**/
		ldr r1, address_of_peg7		/**/
		ldr r1, [r1]
		str r1, [r0]
		ldr r0, address_of_pegT4	/**/
		ldr r1, address_of_peg8		/**/
		ldr r1, [r1]
		str r1, [r0]
		
_Ccheck1:
		ldr r1, address_of_peg1
		ldr r1, [r1]
		ldr r2, address_of_peg5
		ldr r2, [r2]
		cmp r1, r2
		beq	_Ccheck2
		
		ldr r1, address_of_peg1
		ldr r1, [r1]
		ldr r2, address_of_peg2
		ldr r2, [r2]
		ldr r3, address_of_peg3
		ldr r3, [r3]
		ldr r4, address_of_peg4
		ldr r4, [r4]		

		cmp r1, r2
		beq _addC1
_c12:	cmp r1, r3
		beq _addC2
_c13:	cmp r1, r4
		beq _addC3
		
_addC1:
	add r5, r5, #1
	b _c12
_addC2:
	add r5, r5, #1
	b	_c13
_addC3:
	add r5, r5, #1

_Ccheck2:	
		b _again

/*Errors*/		
_err1:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	/*Print Bar*/
	ldr r0, address_of_divider     	/* PRINT DIVIDER */
    bl printf    
	b _p1s
	
_err2:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p2s	

_err3:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p3s	
	
_err4:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p4s


/***********************************************/
_err5:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	/*Print Bar*/
	ldr r0, address_of_divider     	/* PRINT DIVIDER */
    bl printf    
	b _p5s
	
_err6:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p6s	

_err7:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p7s	
	
_err8:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf	
	b _p8s
/***********************************************/

	

/*PLAY AGAIN?*/	
_again:
	/*Prompt Play Again*/
	ldr r0, address_of_againp
	bl printf
	
	/*Scan for Play Again*/
	ldr r0, address_of_scan_pattern	/* r0 ← &Prompt_fibin Scan */
    ldr r1, address_of_again   		/* r1 ← &fibin */
    bl scanf                        /* call to scanf */
	
	ldr r1, address_of_again	  /*If Adress of again is equal to 1 	   */
	ldr r1, [r1]				 /* the player will play again, else	  */
	cmp r1, #1					/*  will branch to _main		  		 */
	beq _trys				   /*_trys will start at player guess input */
	b _main
	
/*Prompt CODEMAKER for Peg values*/
_err:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf
	
/*Back to Main*/
_main:	
	/*Branch Back to main menu*/
	bal main

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_return : .word return				/*Address of Return*/
address_of_peg0 : .word peg0					/*Address of peg1: Code to Break*/
address_of_peg1 : .word peg1					/*Address of peg1: Code to Break*/
address_of_peg2 : .word peg2					/*Address of peg2: Code to Break*/
address_of_peg3 : .word peg3					/*Address of peg3: Code to Break*/
address_of_peg4 : .word peg4					/*Address of peg4: Code to Break*/
address_of_peg5 : .word peg5					/*Address of peg5: Code to Guess*/
address_of_peg6 : .word peg6					/*Address of peg6: Code to Guess*/
address_of_peg7 : .word peg7					/*Address of peg7: Code to Guess*/
address_of_peg8 : .word peg8					/*Address of peg8: Code to Guess*/
address_of_pegT0 : .word pegT0					/*Address of pegT1: Place holder: VALUE ZERO ALWAYS*/
address_of_pegT1 : .word pegT1					/*Address of pegT1: Place holder*/
address_of_pegT2 : .word pegT2					/*Address of pegT2: Place holder*/
address_of_pegT3 : .word pegT3					/*Address of pegT3: Place holder*/
address_of_pegT4 : .word pegT4					/*Address of pegT4: Place holder*/

address_of_error : .word error					/*"Divider Bar for prompt"*/
address_of_prompt : .word prompt				/*"Prompt: For CODEMAKER - Will ask for PEG inputs"*/
address_of_prompt2 : .word prompt2				/*"Prompt: For PLAYER - Will ask for PEG inputs"*/
address_of_cont : .word cont					/*"Prompt: For CODEMAKER - Type anything to cont..."*/
address_of_cont2 : .word cont2					/*"Prompt: For PLAYER - Type anything to cont..."*/
address_of_code : .word code					/*"Prompt: For CODEMAKER - Prints final Code"*/
address_of_code2 : .word code2					/*"Prompt: For CODEMAKER - Prints final Code"*/
address_of_code3 : .word code3					/*"Prompt: For PLAYER - Prints final Code"*/
address_of_code4 : .word code4					/*"Prompt: For PLAYER - Prints final Code"*/
address_of_hit : .word hit						/*"HIT"*/
address_of_space : .word space					/*"SPACE"*/
address_of_trys : .word trys					/*"TRYS LEFT"*/
address_of_againp : .word againp				/*"Prompt: For Play Again"*/
address_of_again : .word again					/*"Prompt: For Play Again"*/
address_of_place : .word place					/*"address_of_place"*/
address_of_color : .word color					/*"address_of_color"*/
address_of_count : .word count					/*"address_of_count when needed"*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/
address_of_sclear : .word sclear					/*"Prompt: CLEARS THE SCREEN WITH 30 \n"*/
address_of_board1 : .word board1					/*"Prints first part of the board: with Trys left"*/
address_of_board2 : .word board2					/*"Prints second part of the board: First Match Pegs"*/
address_of_board3 : .word board3					/*"Prints third of the board: Second Match Pegs"*/
address_of_board4 : .word board4					/*"Prints fourth part of the board: First Color Pegs"*/
address_of_board5 : .word board5					/*"Prints fifth part of the board: Second Color Pegs"*/
address_of_board6 : .word board6					/*"Prints sixth part of the board: Code Input (first 3)"*/
address_of_board7 : .word board7					/*"Prints seventh part of the board: Code Input (last peg)"*/
address_of_board8 : .word board7					/*"Prints last part of the board: Code Input (last peg)"*/
address_of_match : .word match						/*"Prints win prompt"*/
address_of_nomatch : .word nomatch					/*"Prints loss prompt"*/

/* External */
.global printf
.global scanf
