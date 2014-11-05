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

/* Prompt */
.balign 8
prompt: .asciz "CODEMAKER: Pick a Value for Peg %d (1-6): "

/* Error */
.balign 8
Error: .asciz "Error, Value must be within (1-6), Try Again"

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
	mov r1, #1					/* 	of sequence of inputs by Codemaker*/
	str r1, [r5]

	/*Address peg1*/
	ldr r0, address_of_prompt
	ldr r1, address_of_count
	ldr r1, [r1]
	bl printf
	
	/*Scan Peg1*/
	ldr r0, address_of_scan_pattern	/* r0 ← &Prompt_fibin Scan */
    ldr r1, address_of_peg1   		/* r1 ← &fibin */
    bl scanf                        /* call to scanf */
	
	
	/*Branch Back to main menu*/
	bal main

/*Messages*/
address_of_scan_pattern : .word scan_pattern	/*Scan Pattern*/
address_of_return : .word return				/*Address of Return*/
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
address_of_place : .word place					/*"address_of_place"*/
address_of_color : .word color					/*"address_of_color"*/

address_of_count : .word count					/*"address_of_count when needed"*/
@address_of_error2 : .word error2				/*"Overflow Error Prompt"*/

address_of_divider : .word divider				/*"Divider Bar for prompt"*/

/* External */
.global printf
.global scanf
