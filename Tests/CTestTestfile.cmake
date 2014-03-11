# CMake generated Testfile for 
# Source directory: C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins/Tests
# Build directory: C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins/Tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(test1 "mon_executable" "5")
ADD_TEST(runtestprog "c:/openvibe/dependencies/cmake/bin/cmake.exe" "-DTEST_PROG=C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins/Tests/mon_executable.exe" "-DSOURCEDIR=C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins/Tests" "-P" "C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins/Tests/runtest.cmake")
