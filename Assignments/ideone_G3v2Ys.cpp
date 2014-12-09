/*
	Dr. Mark E. Lehr
	Sept 16th, 2014
	Purpose: Inefficient technique for calculating a/b and a%b
	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
	flag -> r4 to reverse contents of r0 and r1
	temp -> r5 position to swap registers
*/
#include <iostream>
using namespace std;

void divmod(int&,int&,int&,int&,int&,int&);

int main() {
	// Declare variables a=111, b=5
	int r2=111, r3=5, r4=0, r5, r0=0, r1=r2;
	//Display the result
	cout<<"Actual Answer a/b = "<<r2/r3<<endl;
	cout<<"Acutal Remainder a%b = "<<r2%r3<<endl;
	//Determine the quotient and remainder
	divmod(r2,r3,r4,r5,r0,r1);
	//Display the calculated results
	cout<<"Calculated a/b = "<<r0<<endl;
	cout<<"Calculated a%b = "<<r1<<endl;
	//Exit
	return 0;
}

void divmod(int &r2,int &r3,int &r4,int &r5,int &r0,int &r1){
	//Determine if division is necessary
	if(r1>=r3){
		do{
			r0++;//Increment div counter by 1
			r1-=r3;//Subtract mod factor
		}while(r1>=r3);
	}
	//Swap if flag is set
	if(r4){int r5=r0;r0=r1;r1=r5;}	
}