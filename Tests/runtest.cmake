execute_process(COMMAND ${TEST_PROG}
                RESULT_VARIABLE HAD_ERROR)
if(HAD_ERROR)
    message(FATAL_ERROR "Test failed")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files
<<<<<<< Updated upstream
    ${CMAKE_BINARY_DIR}/obtained.txt ${CMAKE_CURRENT_SOURCE_DIR}/Tests/expected.txt
    RESULT_VARIABLE DIFFERENT
)
=======
    ${CMAKE_BINARY_DIR}/obtained.txt ${CMAKE_SOURCE_DIR}/Tests/expected.txt
    RESULT_VARIABLE DIFFERENT)
>>>>>>> Stashed changes
if(DIFFERENT)
    #execute_process(COMMAND svn diff expected.txt)
	message(FATAL_ERROR "Test failed - ${CMAKE_BINARY_DIR}/obtained.txt and ${HELLO_SOURCE_DIR}/expected.txt differ")
endif()