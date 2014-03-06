#include "HelloWorld.h"
#include <iostream>
#include <fstream>
using namespace std;
//Commentaire avec //'
int main(int argc, char *argv[]){
    CHelloWorld::CHelloWorld h(3);
	int n=3;
	if(n<argc)
		h.display();
	else
	{
		h.display();
		h.display();
	}
	ofstream myfile;
	myfile.open("obtained.txt");
	myfile << "Hello World";
	myfile.close();
}

