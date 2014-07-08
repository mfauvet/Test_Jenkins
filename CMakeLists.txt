cmake_minimum_required(VERSION 2.8)
set(CMAKE_LEGACY_CYGWIN_WIN32,1)
# Options. Turn on with 'cmake -Dmyvarname=ON'.
OPTION(TEST "Build all tests." OFF) # Makes boolean 'test' available.
OPTION(SQUISHCOCO "Build all tests." OFF) # Makes boolean 'test' available.
OPTION(GCOVR "Build all tests." OFF) # Makes boolean 'test' available.
OPTION(BULLSEYES "Build all tests." OFF) # Makes boolean 'test' available.

project(Test_Hello_World)

<<<<<<< Updated upstream
=======
SET(HELLO_SOURCE_DIR ${CMAKE_SOURCE_DIR})

>>>>>>> Stashed changes
IF(SQUISHCOCO)
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
ENDIF()

IF(GCOVR)
	SET(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")
	SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
	IF(CMAKE_COMPILER_IS_GNUCXX)
		INCLUDE(CodeCoverage.cmake)
		SETUP_TARGET_FOR_COVERAGE_COBERTURA(Test_coverage Test_Hello_World coverage)
	ENDIF()
ENDIF()
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
TARGET_LINK_LIBRARIES(Test_Hello_World project1_lib)

################################
# Testing
################################
IF (TEST)
	ENABLE_TESTING()
	SUBDIRS(Tests)

	IF(CMAKE_COMPILER_IS_GNUCXX)
		##############
		# Unit Tests
		##############
		# This adds another subdirectory, which has 'project(gtest)'.
		add_subdirectory(gtest-1.6.0)
	 
		# Include the gtest library. gtest_SOURCE_DIR is available due to
		# 'project(gtest)' above.
		include_directories(${gtest_SOURCE_DIR}/include)
		
		add_executable(runUnitTests test_gtest.cpp)
		 # Standard linking to gtest stuff.
		TARGET_LINK_LIBRARIES(runUnitTests gtest gtest_main)

		# Extra linking for the project.
		TARGET_LINK_LIBRARIES(runUnitTests project1_lib)
		# This is so you can do 'make test' to see all your tests run, instead of
		# manually running the executable runUnitTests to see those specific tests.
		ADD_TEST(NAME that-test-I-made COMMAND runUnitTests)
	ENDIF()

ENDIF()