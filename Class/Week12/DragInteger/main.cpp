/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on November 15, 2014, 1:17 PM
 * Purpose:  Timing study for integer and float drag functions
 *      Drag = 1/2 x rho x V^2 x Area x Cd
 * comparisons
 */

//System Calls
#include <iostream>
#include <ctime>
#include <cmath>
using namespace std;

int main(int argc, char** argv) {
    //Test the 2 functions
    unsigned int nLoops=1000000000;
    unsigned int begTime,endTime;
    //Integer Function and Variables
    unsigned int iDynp,iArea,iDrag;
    unsigned int iHalf=1;     // 1 bit,  >>1
    unsigned int iRho=0x9B5;  //12 bits, >>20
    unsigned int iVel=200;    // 8 bits
    unsigned int iPi=0x3243F7;//24 bits, >>20
    unsigned int iRad=6;      // 4 bits
    unsigned int iConv=0x1C7; //12 bits, >>16
    unsigned int iCd=0x666;   //12 bits, >>12
    //Time for the integer function
    begTime=time(0);
    for(unsigned int i=1;i<=nLoops;i++){
        iDynp=iHalf;  //xBit  1, BP- 1
        iDynp*=iRho;  //xBit 12, BP-21
        iDynp*=iVel;  //xBit 20, BP-21
        iDynp*=iVel;  //xBit 28, BP-21
        iDynp>>=12;   //xBit 16, BP- 9
        iArea=iPi;    //xBit 24, BP-20
        iArea*=iRad;  //xBit 28, BP-20
        iArea*=iRad;  //xBit 32, BP-20
        iArea>>=12;   //xBit 20, BP- 8
        iArea*=iConv; //xBit 32, BP-24
        iArea>>=16;   //xBit 16  BP- 8
        iDrag=iDynp*iArea;//xBit 32 BP-17
        iDrag>>=12;   //xBit 20  BP- 5
        iDrag*=iCd;   //xBit 32  BP-17
    }
    endTime=time(0);
    //Output the Integer Drag
    cout<<endl;
    cout<<"Integer Dynamic Pressure  = "<<(iDynp>>9)<<"(lbs)"<<endl;
    cout<<"Cross Sectional Area x 32 = "<<(iArea>>3)<<"(ft^2)"<<endl;
    cout<<"Integer Drag x 32 = "<<(iDrag>>12)<<"(lbs)";
    cout<<" Loops = "<<nLoops;
    cout<<" Time = "<<endTime-begTime<<"(secs)"<<endl;
    cout<<endl;
    //Float Function and Variables
    float fDynp,fArea,fDrag;
    float fHalf=0.5f;
    float fRho=0.00237f; //slug/ft^3
    float fVel=200;      //ft/sec
    float fPi=atan(1)*4; //Pi
    float fRad=6;        //Radius 6 to 18 inches
    float fConv=1.0f/144;//inches to feet
    float fCd=0.4f;      //Spherical Cd
    //Time for the integer function
    unsigned int iDummy=pow(2,32);
    begTime=time(0);
    for(unsigned int i=1;i<=nLoops;i++){
        fDynp=fHalf;
        fDynp*=fRho;
        fDynp*=fVel;
        fDynp*=fVel;
        fArea=fPi;
        fArea*=fRad;
        fArea*=fRad;
        fArea*=fConv;
        fDrag=fDynp*fArea;
        fDrag*=fCd;
        //Utilize the same operations as for the integer for timing comparisons
        iDummy>>=10;
        iDummy>>=10;
        iDummy<<=10;
        iDummy<<=10;
    }
    endTime=time(0);
    //Output the Floating Drag
    cout<<endl;
    cout<<"Floating Dynamic Pressure = "<<fDynp<<"(lbs)"<<endl;
    cout<<"Cross Sectional Area x 32 = "<<fArea*32<<"(ft^2)"<<endl;
    cout<<"Floating Drag x 32 = "<<fDrag*32<<"(lbs)";
    cout<<" Loops = "<<nLoops;
    cout<<" Time = "<<endTime-begTime<<"(secs)"<<endl;
    cout<<endl;
    //Exit stage right
    return 0;
}
