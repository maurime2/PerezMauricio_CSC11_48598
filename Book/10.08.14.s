/*
	Dr. Mark E. Lehr
	Sept 24th, 2014
	Purpose: Efficient technique for calculating a/b and a%b
	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
	Divisor Scale -> r4 
	Subtraction Scale -> r5 = b*r4
*/
#include <iostream>
using namespace std;

void divMod(int&,int&,int&,int&,int&);
void scaleLeft(int&,int&,int&);
void addSub(int&,int&,int&,int&);
void scaleRight(int&,int&,int&);

//Roughly 20 Lines of assembly
int main() {
	// Declare variables and initialize r2/r3 => r0  r2%r3 => r1
	int r2=11111, r3=5, r4=1, r5=r3, r0=0, r1=r2;//Roughly 6 lines of assembly
	//Display result
	cout<<"Actual Answer a/b = "<<r2/r3<<endl;
	cout<<"Acutal Remainder a%b = "<<r2%r3<<endl;
	//Determine the quotient and remainder
	divMod(r3,r4,r5,r0,r1);//Roughly 14 lines of assembly
	//Display the calculated results
	cout<<"Calculated a/b = "<<r0<<endl;
	cout<<"Calculated a%b = "<<r1<<endl;
	//Exit
	return 0;
}

//Roughly 5 lines of assembly
void scaleLeft(int &r1,int &r4,int &r5){
	do{           //Scale left till overshoot with remainder
		r4<<=1;   //scale factor
		r5<<=1;   //subtraction factor
	}while(r1>r5);//End loop at overshoot
	r4>>=1;       //Scale factor back
	r5>>=1;       //Scale subtraction factor back
}

//Roughly 3 lines of assembly
void scaleRight(int &r1,int &r4,int &r5){
	do{           //Shift right until just under the remainder
		r4>>=1;   //Division counter
		r5>>=1;   //Mod/Remainder subtraction
	}while(r1<r5);//Compare remainder with subtraction factor
}

//Roughly 4 lines of assembly without ScaleRight
//Roughly 7 lines of assembly with ScaleRight
void addSub(int &r4,int &r5,int &r0,int &r1){
	do{                      //Just a loop
		r0+=r4;              //Count the subtracted scale factor
		r1-=r5;              //Subtract the scaled mod
		scaleRight(r1,r4,r5);//Keep scaling right until < remainder
	}while(r4>=1);           //Loop until division is complete
}

//Roughly 14 lines of Assembly
void divMod(int &r3,int &r4,int &r5,
                    int &r0,int &r1){
	//Determine the quotient and remainder
	if(r1>=r3){//Compare and exit if a<b when a%b
		scaleLeft(r1,r4,r5);
		addSub(r4,r5,r0,r1);
	}
}