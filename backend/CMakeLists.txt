
project(DeviceFleetServer)
cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 17)

set(PROTO_TARGET device_fleet_proto)
add_subdirectory(src/proto)


set(SOURCE_FILES src/main.cpp)

add_executable(DeviceFleetServer ${SOURCE_FILES})
target_link_libraries(DeviceFleetServer PRIVATE "${PROTO_TARGET}")