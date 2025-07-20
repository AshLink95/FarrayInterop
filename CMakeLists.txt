cmake_minimum_required(VERSION 4.0.3)

project(cicifetti LANGUAGES CXX Fortran)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)
set(CMAKE_Fortran_STANDARD 03)
set(CMAKE_Fortran_STANDARD_REQUIRED True)
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/mods)

add_library(farray STATIC ${CMAKE_SOURCE_DIR}/src/dlla.f90 ${CMAKE_SOURCE_DIR}/src/farrayimp1D.f90)
include_directories(${CMAKE_SOURCE_DIR}/libdir)
target_include_directories(farray PUBLIC ${CMAKE_SOURCE_DIR}/libdir)
target_link_libraries(farray PUBLIC gfortran)
set_target_properties(farray PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/libdir
)

add_custom_target(purge
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${CMAKE_BINARY_DIR}
    COMMAND_EXPAND_LISTS
    VERBATIM
)

enable_testing()
add_library(Test INTERFACE)
target_link_libraries(Test INTERFACE farray gtest gtest_main)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/tests)

add_executable(test1D ${CMAKE_SOURCE_DIR}/tests/test1D.cpp)
target_link_libraries(test1D PUBLIC Test)
add_test(NAME test1D COMMAND test1D)
