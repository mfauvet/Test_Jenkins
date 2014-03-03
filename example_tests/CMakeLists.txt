#Déclaration de l'exécutable
add_executable(
	mon_executable
	HelloWorld.h
	HelloWorld.cpp
	main.cpp
)
target_link_libraries(example_tests)
add_test(test mon_executable)