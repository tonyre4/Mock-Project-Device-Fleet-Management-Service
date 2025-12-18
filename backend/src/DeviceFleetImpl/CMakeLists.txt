
add_library(${TARGET_NAME} STATIC DeviceFleetImpl.cpp)
target_include_directories(${TARGET_NAME} PRIVATE "${COMMON_INCLUDE_DIR}")
target_link_libraries(${TARGET_NAME} PRIVATE proto)