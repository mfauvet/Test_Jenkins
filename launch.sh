mkdir minGW-build
cd minGW-build
cmake -G"MinGW Makefiles" -DCMAKE_BUILD_TYPE="Debug" -DPYTHON_EXECUTABLE="C:/Python27/python.exe" -DGCOVR_PATH="C:/Python27/Scripts/gcovr" -Dtest=ON
C:/MinGW/bin/mingw32-make.exe
C:/MinGW/bin/mingw32-make Test_coverage
C:/MinGW/bin/mingw32-make Tests