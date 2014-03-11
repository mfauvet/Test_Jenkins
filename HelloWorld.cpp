#include "HelloWorld.h"

HelloWorld::HelloWorld(){
	truc=0;
}

/**
* Un joli commentaire utile
**/
void HelloWorld::display()
{	int machin;
	machin = 1;
	if(this->truc==3)
			std::cout<<"Hello";
	else
	{
		machin = std::min(machin, 3);
		machin;
	}
	
	std::cout<<" World"<<std::endl;
}

void independentMethod(int &i) {
	i = 0;
}