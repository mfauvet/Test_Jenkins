# set variables for script
SET (CTEST_SITE          "discworld.kitware")
SET (CTEST_BUILD_NAME    "Windows")
SET (CTEST_NOTES_FILES   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
SET (CTEST_DASHBOARD_ROOT   "C:/Users/mfauvet/Documents/Visual_Studio_2010/Projects/Test_Hello_World/Test_Jenkins")
SET (CTEST_SOURCE_DIRECTORY "${CTEST_DASHBOARD_ROOT}")
SET (CTEST_BINARY_DIRECTORY "${CTEST_DASHBOARD_ROOT}/bullseyes-build")
# Set the output file for bullsey
SET (ENV{COVFILE} "${CTEST_BINARY_DIRECTORY}/Hello.cov")
SET (CTEST_UPDATE_COMMAND    "cvs")
SET (CTEST_CMAKE_GENERATOR "NMake Makefiles")
SET (CTEST_PROJECT_NAME "Hello")

# clear the binary directory and create an initial cache
CTEST_EMPTY_BINARY_DIRECTORY (${CTEST_BINARY_DIRECTORY})
# this is the initial cache to use for the binary tree, be careful to escape
# any quotes inside of this string if you use it
FILE(
	WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt"
	"CTEST_TEST_CTEST:BOOL=1"
)

# Find cov01, the bullseye tool to turn on/off coverage
FIND_PROGRAM(COV01 cov01)
IF(NOT COV01)
	MESSAGE(FATAL_ERROR "Could not find cov01")
ENDIF(NOT COV01)

# turn off coverage for configure step
SET(RES 1)
EXECUTE_PROCESS(COMMAND ${COV01} -0 RESULT_VARIABLE RES)
IF(RES)
 MESSAGE(FATAL_ERROR "could not run cov01 -0")
ENDIF(RES)

# do the dashboard steps
CTEST_START (NightlyCoverage)
CTEST_UPDATE (SOURCE "${CTEST_SOURCE_DIRECTORY}")
CTEST_CONFIGURE (BUILD "${CTEST_BINARY_DIRECTORY}")
# turn on coverage for build and test
SET(RES 1)
EXECUTE_PROCESS(COMMAND ${COV01} -1 RESULT_VARIABLE RES)
IF(RES)
 MESSAGE(FATAL_ERROR "could not run cov01 -1")
ENDIF(RES)
CTEST_BUILD (BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_TEST  (BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_COVERAGE(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_SUBMIT ()
EXECUTE_PROCESS(COMMAND ${COV01} -0 RESULT_VARIABLE RES)