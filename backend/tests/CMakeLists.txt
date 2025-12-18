find_package(GTest REQUIRED)

set(MAIN_TEST_TARGET_NAME unit_tests)

set(TEST_SOURCES 
    main_test.cpp
    DeviceFleetImpl/DeviceFleetImpl.cpp
)
add_executable(${MAIN_TEST_TARGET_NAME} ${TEST_SOURCES})

target_link_libraries(${MAIN_TEST_TARGET_NAME} PRIVATE proto GTest::GTest GTest::Main pthread)
target_include_directories(${MAIN_TEST_TARGET_NAME} PRIVATE "${COMMON_INCLUDE_DIR}")