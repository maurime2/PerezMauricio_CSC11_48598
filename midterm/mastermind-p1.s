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
.balign 8
peg0: .word 0	/*code peg 1*/
peg1: .word 1	/*code peg 1*/
peg2: .word 2	/*code peg 2*/
peg3: .word 3	/*code peg 3*/
peg4: .word 4	/*code peg 4*/
peg5: .word 5	/*code peg 5*/
peg6: .word 6	/*code peg 6*/
peg7: .word 7	/*code peg 7*/
peg8: .word 8	/*code peg 8*/
count: .word 0	/*Count of Pegs*/
place: .word 0	/*Count of Guesses of right place and colors*/
color: .word 0	/*Count of Guesses of right colors, wrong place*/
again: .word 0	/*1 = Play Again when asked*/

/* Prompt */
.balign 8
prompt: .asciz "CODEMAKER: Pick a Value for Peg %d (1-6): "

/* CODEMAKER CODE PRINT */
.balign 8
code: .asciz "CODEMAKER: Your CODE is: <%d%d%d"

/* CODEMAKER CODE PRINT */
.balign 8
code2: .asciz "%d>\n"

/* Prompt Play Again */
.balign 8
againp: .asciz "Play Again? [1] for YES, else for NO "

/*PROMPT: Type anything to continue*/
.balign 8
cont: .asciz "Type anything to continue..."

/* Error */
.balign 8
error: .asciz "Error, Value must be within (1-6), Try Again\n"

/* Divider */
.balign 8
divider: .asciz "-------------------------------------------------------\n"

.text

_mastermind:
	
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
	ldr r0, address_of_scan_pattern	/* r0 ← &Scan pattern */
    ldr r1, address_of_peg0   		/* r1 ← &peg 5 TEMP */
    bl scanf                        /* call to scanf */
	
	b _again
	
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
	
_again:
	/*Prompt Play Again*/
	ldr r0, address_of_againp
	bl printf
	
	/*Scan for Play Again*/
	ldr r0, address_of_scan_pattern	/* r0 ← &Prompt_fibin Scan */
    ldr r1, address_of_again   		/* r1 ← &fibin */
    bl scanf                        /* call to scanf */
	
	ldr r1, address_of_again	  /*If Adress of again is equal to 1 */
	ldr r1, [r1]				 /* the player will play again, else*/
	cmp r1, #1					/*  will branch to _main		   */
	beq _mastermind
	b _main
	
/*Prompt CODEMAKER for Peg values*/
	
_err:
	/*Prompt error: Wrong Peg Number*/
	ldr r0, address_of_error
	bl printf
	
	
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
address_of_error : .word error					/*"Divider Bar for prompt"*/
address_of_prompt : .word prompt				/*"Prompt: For CODEMAKER - Will ask for PEG inputs"*/
address_of_cont : .word cont					/*"Prompt: For CODEMAKER - Typr anything to cont..."*/
address_of_code : .word code					/*"Prompt: For CODEMAKER - Prints final Code"*/
address_of_code2 : .word code2					/*"Prompt: For CODEMAKER - Prints final Code"*/
address_of_againp : .word againp				/*"Prompt: For Play Again"*/
address_of_again : .word again					/*"Prompt: For Play Again"*/
address_of_place : .word place					/*"address_of_place"*/
address_of_color : .word color					/*"address_of_color"*/
address_of_count : .word count					/*"address_of_count when needed"*/
address_of_divider : .word divider				/*"Divider Bar for prompt"*/

/* External */
.global printf
.global scanf
