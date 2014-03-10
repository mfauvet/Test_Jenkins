cmake -G"MinGW Makefiles" -DCMAKE_BUILD_TYPE="Debug" -DPYTHON_EXECUTABLE="C:/Python27/python.exe" -DGCOVR_PATH="C:/Python27/Scripts/gcovr"
mingw32-make
mingw32-make Test_coverage
PAUSE