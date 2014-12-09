/*divMod.s File
Mauricio S. Perez
Midterm: CSC11-48598
divMod
*/

.global _divMod

.data

.text
 
_divMod:
	add r1, r1, #1
	
	bal main						@ Branch to Main and output Problem Select
	
	
/*Messages*/
/* External */
.global printf
.global scanf
