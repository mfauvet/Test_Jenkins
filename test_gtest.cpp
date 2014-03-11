#include "gtest/gtest.h"
#include <iostream>
#include "HelloWorld.h"

TEST(SampleTest, AssertionTrue) {
    ASSERT_EQ(1, 1);
}

// IndependentMethod is a test case - here, we have 2 tests for this 1 test case
TEST(IndependentMethod, ResetsToZero) {
	int i = 3;
	independentMethod(i);
	EXPECT_EQ(0, i);

	i = 12;
	independentMethod(i);
	EXPECT_EQ(0,i);
}

TEST(IndependentMethod, ResetsToZero2) {
	int i = 0;
	independentMethod(i);
	EXPECT_EQ(0, i);
}

// The fixture for testing class Project1. From google test primer.
class Project1Test : public testing::Test {
	public:
		Project1Test();
	// You can remove any or all of the following functions if its body
	// is empty.
	HelloWorld p;
};

Project1Test::Project1Test(){
	this->p=HelloWorld(3);
}

// Test case must be called the class above
// Also note: use TEST_F instead of TEST to access the test fixture (from google test primer)
TEST_F(Project1Test, MethodBarDoesAbc) {
	int i = 1;
	p.display(); // we have access to p, declared in the fixture
	EXPECT_EQ(1, i);
}