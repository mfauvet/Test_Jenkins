#ifndef HELLOWORLD
#define HELLOWORLD
#endif

#include<iostream>
#include <string>
class HelloWorld{
	public:
		int truc;
		HelloWorld();
		HelloWorld(int t): truc(t){};
		void display();
};

void independentMethod(int &i);

class Hello{};
