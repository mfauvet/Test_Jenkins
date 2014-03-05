ADD_EXECUTABLE(
	mon_executable
	../HelloWorld.h
	../HelloWorld.cpp
	../main.cpp
)
ADD_TEST(test1 mon_executable 5)
#ADD_TEST(test2 ${CMAKE_COMMAND} -E compare_files obtained.txt expected.txt)
#ADD_TEST(test3 ${CMAKE_COMMAND} -E compare_files 1secSinusOscillator.csv 1secSinusOscillator-obtained.csv)
add_test(NAME runtestprog
    COMMAND ${CMAKE_COMMAND}
    -DTEST_PROG=$<TARGET_FILE:mon_executable>
    -DSOURCEDIR=${CMAKE_CURRENT_SOURCE_DIR}
    -P ${CMAKE_CURRENT_SOURCE_DIR}/runtest.cmake
)