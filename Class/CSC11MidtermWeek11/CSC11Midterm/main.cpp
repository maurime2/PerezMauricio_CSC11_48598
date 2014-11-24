//Dr. Mark E. Lehr
//October 14th, 2014
//Menu to be used for the midterm
//homework and final, etc....

//Library includes Here!!!
#include <iostream>
using namespace std;

//Global Constants Here!!!

//Function Prototypes Here!!!
void Menu();
int getN();
void def(int);
void problem1();
void problem2();
void problem3();

//Begin Execution Here!!!
int main(int argv,char *argc[]){
    int inN;
    do{
        Menu();
        inN=getN();
        switch(inN){
        case 1:    problem1();break;
        case 2:    problem2();break;
        case 3:    problem3();break;
        default:   def(inN);}
    }while(inN>=1&&inN<=3);
    return 0;//If midterm not perfect, return something other than 1
}

void Menu(){
    cout<<"Menu for the Midterm"<<endl;
    cout<<"Type 1 for problem 1"<<endl;
    cout<<"Type 2 for problem 2"<<endl;
    cout<<"Type 3 for problem 3"<<endl;
    cout<<"Type anything else to exit \n"<<endl;
}

int getN(){
        int inN;
        cin>>inN;
        return inN;
}

void problem1(){
        //Prompt user input
        cout<<endl<<"In problem # 1 PayCheck Calculator"<<endl;
        cout<<"Input hours worked (hrs) and rate of pay ($s/hr)"<<endl<<endl;
        //Declare variables
        int r1,r2,r3=0;
        //Input the values
        cin>>r1>>r2;
        cout<<"Your inputs were "<<r1<<" (hrs) and "<<r2<<" ($/hr)"<<endl;
        //Calculate the results
        do{
            r3+=r1*r2;
            r1-=20;
        }while(r1>0);
        //Output user inputs
        cout<<"Output paycheck = $"<<r3<<endl<<endl;
}

void problem2(){
        //Prompt user input
        cout<<endl<<"In problem # 1 Cable Calculator"<<endl;
        cout<<"Input Package (a,b,c) and hours used (hrs)"<<endl<<endl;
        //Declare variables
        char r1;
        int r2,r3,r4,r5,r6;
        //Input the values
        cin>>r1>>r2;
        cout<<"Your inputs were the "<<r1<<" Package and "<<r2<<" (hrs)"<<endl;
        //Calculate the results
        r3=(r1-'a'+1);
        r5=('c'-r1+1);
        r1=25+r3*5;
        r4=11*r3;
        r6=0;
        while(r2>r4&&r6++<2){
           r2-=r4;
           r1+=r2*r5;
        }
        //Output user inputs
        cout<<"Cable Bill = $"<<static_cast<int>(r1)<<endl<<endl;
}

void problem3(){
        //Prompt user input
        cout<<endl<<"In problem # 3 Fibonacci Calculator"<<endl;
        cout<<"Input Fibonacci term to calculate"<<endl<<endl;
        //Declare variables
        int r1,r2=0,r3=1,r4=2,r5;
        //Input the values
        cin>>r1;
        r5=r1;
        cout<<"Your input was "<<r1<<" for the Fibonacci term"<<endl;
        //Calculate the results
        if(r5==1){
            r1=r2;
        }else if(r5==2){
            r1=r3;
        }else{
            do{
                r1=r2+r3;
                r3=r2;
                r2=r1;
            }while(++r4<=r5);
        }
        //Output user inputs
        cout<<"The Fibonacci term = "<<r1<<endl<<endl;
}

void def(int inN){
        cout<<"You typed "<<inN<<" to exit the program"<<endl;
}