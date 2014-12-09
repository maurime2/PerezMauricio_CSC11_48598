/*scaleLeft.s File
Mauricio S. Perez
Midterm: CSC11-48598
scaleLeft
*/

.global _scaleLeft

.data

.text
 
_scaleLeft:
	add r4, r4, #1
	
	bal main						@ Branch to Main and output Problem Select
	
	
/*Messages*/


/* External */
.global printf
.global scanf
