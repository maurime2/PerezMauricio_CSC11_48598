/*addSub.s File
Mauricio S. Perez
Midterm: CSC11-48598
addSub
*/

.global _addSub

.data

.text
 
_addSub:
	add r3, r3, #1
	
	bal main						@ Branch to Main and output Problem Select
	
	
/*Messages*/
/* External */
.global printf
.global scanf
