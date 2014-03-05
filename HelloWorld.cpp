#include "HelloWorld.h"

/**
* Un joli commentaire utile
**/
void CHelloWorld::CHelloWorld::display()
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
