/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on October 27, 2014, 11:21 AM
 */

#include <cstdlib>
#include <ctime>
#include <iostream>
using namespace std;


int main(int argc, char** argv) {
    //Test out the random number generator
    srand(static_cast<unsigned int>(time(0)));
    int beg=time(0);
    //Loop random number function
    unsigned int loops=3400000000;//Clock speed
    for(unsigned int i=0;i<loops;i++){
        int rnd=rand()%90+10;
        //cout<<"Random number generated = "<<rnd<<endl;
    }
    int end=time(0);
    cout<<"Total Time = "<<end-beg<<" Secs"<<endl;
    cout<<"Cycles for random function = "<<end-beg<<" Cycles"<<endl;
    //Exit stage right
    return 0;
}

