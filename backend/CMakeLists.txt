
project(DeviceFleetServer)
cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 17)

set(COMMON_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include")
add_subdirectory(src)
add_subdirectory(tests)