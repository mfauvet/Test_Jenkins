cmake_minimum_required(VERSION 2.8)
set(CMAKE_LEGACY_CYGWIN_WIN32,1)
# Options. Turn on with 'cmake -Dmyvarname=ON'.
option(test "Build all tests." OFF) # Makes boolean 'test' available.

# Make PROJECT_SOURCE_DIR, PROJECT_BINARY_DIR, and PROJECT_NAME available.
set(PROJECT_NAME Test_Hello_World)
project(${PROJECT_NAME})
SET(CMAKE_CXX_FLAGS "-g -O0 -fprofile-arcs -ftest-coverage")
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
if(CMAKE_COMPILER_IS_GNUCXX)
    include(CodeCoverage.cmake)
    SETUP_TARGET_FOR_COVERAGE_COBERTURA(Test_coverage Test_Hello_World coverage)
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
  # This adds another subdirectory, which has 'project(gtest)'.
#  add_subdirectory(gtest-1.6.0)
#  enable_testing()

  # Include the gtest library. gtest_SOURCE_DIR is available due to
  # 'project(gtest)' above.
#  include_directories(${gtest_SOURCE_DIR}/include)


endif()