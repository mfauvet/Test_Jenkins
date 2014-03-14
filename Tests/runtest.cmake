execute_process(COMMAND ${TEST_PROG}
                RESULT_VARIABLE HAD_ERROR)
if(HAD_ERROR)
    message(FATAL_ERROR "Test failed")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files
    obtained.txt ${CMAKE_CURRENT_SOURCE_DIR}\Tests\expected.txt
    RESULT_VARIABLE DIFFERENT)
if(DIFFERENT)
    #execute_process(COMMAND svn diff expected.txt)
	message(FATAL_ERROR "Test failed - files differ")
endif()