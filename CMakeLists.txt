cmake_minimum_required(VERSION 2.8)
set(CMAKE_LEGACY_CYGWIN_WIN32,1)
# Options. Turn on with 'cmake -Dmyvarname=ON'.
option(test "Build all tests." OFF) # Makes boolean 'test' available.
option(squishcoco "Build all tests." OFF) # Makes boolean 'test' available.
option(gcovr "Build all tests." OFF) # Makes boolean 'test' available.
option(bullseyes "Build all tests." OFF) # Makes boolean 'test' available.
# Make PROJECT_SOURCE_DIR, PROJECT_BINARY_DIR, and PROJECT_NAME available.
set(PROJECT_NAME Test_Hello_World)
project(${PROJECT_NAME})

if(squishcoco)
	#####################
	# Try SquishCoco
	#####################
	SET(COVERAGE_FLAGS "--cs-on --cs-count")
	SET( CMAKE_CXX_FLAGS_COVERAGE
	"${CMAKE_C_FLAGS_RELEASE} ${COVERAGE_FLAGS}" CACHE STRING
	"Flags used by the C++ compiler during coverage builds."
	FORCE )
	SET( CMAKE_C_FLAGS_COVERAGE
	"${CMAKE_CXX_FLAGS_RELEASE} ${COVERAGE_FLAGS}" CACHE STRING
	"Flags used by the C compiler during coverage builds."
	FORCE )
	SET( CMAKE_EXE_LINKER_FLAGS_COVERAGE
	"${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${COVERAGE_FLAGS}" CACHE STRING
	"Flags used for linking binaries during coverage builds."
	FORCE )
	SET( CMAKE_SHARED_LINKER_FLAGS_COVERAGE
	"${CMAKE_SHARED_LINKER_FLAGS_RELEASE} ${COVERAGE_FLAGS}" CACHE STRING
	"Flags used by the shared libraries linker during coverage builds."
	FORCE )
	SET( CMAKE_STATIC_LINKER_FLAGS_COVERAGE
	"${CMAKE_STATIC_LINKER_FLAGS_RELEASE} ${COVERAGE_FLAGS}" CACHE STRING
	"Flags used by the static libraries linker during coverage builds."
	FORCE )
	MARK_AS_ADVANCED(
	CMAKE_CXX_FLAGS_COVERAGE
	CMAKE_C_FLAGS_COVERAGE
	CMAKE_EXE_LINKER_FLAGS_COVERAGE
	CMAKE_SHARED_LINKER_FLAGS_COVERAGE
	CMAKE_STATIC_LINKER_FLAGS_COVERAGE
	COMPILE_DEFINITIONS_COVERAGE
	)
	######End of try with squishcoco#########
endif()

if(gcovr)
	SET(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")
	set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
	if(CMAKE_COMPILER_IS_GNUCXX)
		include(CodeCoverage.cmake)
		SETUP_TARGET_FOR_COVERAGE_COBERTURA(Test_coverage Test_Hello_World coverage)
	endif()
endif()
#set(CMAKE_CXX_FLAGS "-g -Wall")

# If you want your own include/ directory, set this, and then you can do
# include_directories(${COMMON_INCLUDES}) in other CMakeLists.txt files.
# set(COMMON_INCLUDES ${PROJECT_SOURCE_DIR}/include)

################################
# Normal Libraries & Executables
################################
add_library(project1_lib HelloWorld.cpp)
add_executable(Test_Hello_World main.cpp)
# Key idea: SEPARATE OUT your main() function into its own file so it can be its
# own executable. Separating out main() means you can add this library to be
# used elsewhere.
target_link_libraries(Test_Hello_World project1_lib)

################################
# Testing
################################
if (test)
	enable_testing()
	subdirs(Tests)

	##############
	# Unit Tests
	##############
	# This adds another subdirectory, which has 'project(gtest)'.
	add_subdirectory(gtest-1.6.0)
 
	# Include the gtest library. gtest_SOURCE_DIR is available due to
	# 'project(gtest)' above.
	include_directories(${gtest_SOURCE_DIR}/include)
	
	add_executable(${CMAKE_BINARY_DIR}/runUnitTests test_gtest.cpp)
	 # Standard linking to gtest stuff.
	target_link_libraries(${CMAKE_BINARY_DIR}/runUnitTests gtest gtest_main)

	# Extra linking for the project.
	target_link_libraries(${CMAKE_BINARY_DIR}/runUnitTests project1_lib)

	# This is so you can do 'make test' to see all your tests run, instead of
	# manually running the executable runUnitTests to see those specific tests.
	add_test(NAME that-test-I-made COMMAND ${CMAKE_BINARY_DIR}/runUnitTests)

endif()