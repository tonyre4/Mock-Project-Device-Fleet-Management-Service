
set(SOURCES_TARGETS_DIRS
    DeviceFleetImpl
    proto
)

foreach(TARGET_DIR ${SOURCES_TARGETS_DIRS})
    set(TARGET_NAME ${TARGET_DIR})
    add_subdirectory(${TARGET_DIR})
endforeach()

set(MAIN_TARGET_NAME main_DeviceFleetServer)
add_executable(${MAIN_TARGET_NAME} main.cpp)
target_link_libraries(${MAIN_TARGET_NAME} PRIVATE "${SOURCES_TARGETS_DIRS}")