ADD_EXECUTABLE(
	mon_executable
	${PROJECT_SOURCE_DIR}/HelloWorld.h
	${PROJECT_SOURCE_DIR}/HelloWorld.cpp
	${PROJECT_SOURCE_DIR}/main.cpp
)
ADD_TEST(testBidon mon_executable 5)
add_test(NAME runtestprog
    COMMAND ${CMAKE_COMMAND}
    -DTEST_PROG=$<TARGET_FILE:mon_executable>
    -DSOURCEDIR=${CMAKE_CURRENT_SOURCE_DIR}
    -P ${CMAKE_CURRENT_SOURCE_DIR}/runtest.cmake
)
