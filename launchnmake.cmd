CALL "C:/Program Files (x86)/Microsoft Visual Studio 10.0/VC/bin/vcvars32.bat"

SET MY_LOCAL_COV_FILE=%WORKSPACE%\hello%BUILD_NUMBER%.cov
SET COVFILE=%WORKSPACE%\hello%BUILD_NUMBER%.cov
SET COVBUILDZONE=%BUILD_NUMBER%
echo %MY_LOCAL_COV_FILE%
covselect --file "%MY_LOCAL_COV_FILE%" --add %WORKSPACE%\HelloWorld.cpp %WORKSPACE%\HelloWorld.h
cov01 --on
mkdir nmake_build 2>NUL
cd nmake_build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE="Debug" -DTEST=ON
"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\nmake.exe"
"C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\nmake.exe" Tests
ctest -T Test
cov01 --off