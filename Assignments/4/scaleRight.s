/*scaleRight.s File
Mauricio S. Perez
Midterm: CSC11-48598
scaleRight
*/

.global _scaleRight

.data

.text
 
_scaleRight:
	add r2, r2, #1
	bal main						@ Branch to Main and output Problem Select
	
	
/*Messages*/

/*External*/
.global printf
.global scanf
