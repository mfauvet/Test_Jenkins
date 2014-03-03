CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
#Déclaration du projet
PROJECT(Test_Hello_World)

ENABLE_TESTING()
INCLUDE(DartConfig.cmake)
INCLUDE(Dart)

IF(CMAKE_COMPILER_IS_GNUCXX  AND NOT BUILD_SHARED_LIBS)
	SET(CMAKE_CXX_FLAGS "-fprofile-arcs -ftest-coverage")
ENDIF(CMAKE_COMPILER_IS_GNUCXX AND NOT BUILD_SHARED_LIBS)

ADD_EXECUTABLE(
	mon_executable
	HelloWorld.h
	HelloWorld.cpp
	main.cpp
)
ADD_TEST(test1 mon_executable 5 -foo)