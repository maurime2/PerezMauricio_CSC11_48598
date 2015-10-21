/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on November 15, 2014, 1:17 PM
 * Purpose:  Timing Study for integer vs. float
 * comparisons
 */

//System Calls
#include <cstdlib>
#include <iostream>
#include <ctime>
#include <iomanip>
using namespace std;

//Temperature function
float fTemp(int);
int   iTemp(int);
void divMod(int&,int&,int&);
void scaleLeft(int&,int&,int&);
void addSub(int&,int&,int&,int&);
void scaleRight(int&,int&,int&);

int main(int argc, char** argv) {
    //Test the 2 functions
    cout<<setprecision(2)<<fixed<<showpoint;
    for(int i=32;i<=212;i+=5){
        int result,den=9,num=(i-32)*5;
        divMod(den,result,num);
        cout<<"Float "<<i<<" conversion = "<<fTemp(i);
        cout<<" Integer conversion = "<<iTemp(i);
        cout<<" Div Mod = "<<result<<endl;
    }
    //Time for the integer function
    unsigned int nLoops=4000000000;
    int begTime=time(0);
    for(int i=1;i<=nLoops;i++){
        iTemp(212);
    }
    int endTime=time(0);
    cout<<"Integer conversion "<<nLoops<<" times took "<<endTime-begTime<<" (secs)"<<endl;
    //Time for the float function
    int bgdTime=time(0);
    int result,den,num,fact=100;
    for(int i=1;i<=nLoops/fact;i++){
        den=9,num=900;
        divMod(den,result,num);
    }
    int eddTime=time(0);
    cout<<"DivMod  conversion "<<nLoops/fact<<" times took "<<eddTime-bgdTime<<" (secs)"<<endl;
    //Time for the float function
    int bgTime=time(0);
    for(int i=1;i<=nLoops;i++){
        fTemp(212);
    }
    int edTime=time(0);
    cout<<"Float   conversion "<<nLoops<<" times took "<<edTime-bgTime<<" (secs)"<<endl;
    //Exit stage right
    return 0;
}

int   iTemp(int f){
    static int c=0x8E38F;
    return c*(f-32)>>20;
}

float fTemp(int f){
    static float c=static_cast<float>(5.0)/9;
    return c*(f-32);
}

//Roughly 5 lines of assembly
void scaleLeft(int &r1,int &r3,int &r2){
	do{               //Scale left till overshoot with remainder
		r3<<=1;   //scale factor
		r2<<=1;   //subtraction factor
	}while(r1>=r2);   //End loop at overshoot
	r3>>=1;           //Scale factor back
	r2>>=1;           //Scale subtraction factor back
}

//Roughly 3 lines of assembly
void scaleRight(int &r1,int &r3,int &r2){
	do{               //Shift right until just under the remainder
		r3>>=1;   //Division counter
		r2>>=1;   //Mod/Remainder subtraction
	}while(r1<r2);    //Compare remainder with subtraction factor
}

//Roughly 4 lines of assembly without ScaleRight
//Roughly 7 lines of assembly with ScaleRight
void addSub(int &r3,int &r2,int &r0,int &r1){
	do{                          //Just a loop
		r0+=r3;              //Count the subtracted scale factor
		r1-=r2;              //Subtract the scaled mod
		scaleRight(r1,r3,r2);//Keep scaling right until < remainder
	}while(r3>=1);                //Loop until division is complete
}

//Roughly 14 lines of Assembly
void divMod(int &r2,int &r0,int &r1){
	//Determine the quotient and remainder
	r0=0;
	int r3=1;
	if(r1>=r2){//Compare and exit if a<b when a%b
		scaleLeft(r1,r3,r2);
		addSub(r3,r2,r0,r1);
	}
}