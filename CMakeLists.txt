cmake_minimum_required(VERSION 3.16)
project(SneakySnakeFYP LANGUAGES CXX)
find_package(OpenMP REQUIRED COMPONENTS CXX)
add_executable(sneaky_snake
    software/cpu/src/main.cpp
    software/cpu/src/SneakySnake.cpp)
target_include_directories(sneaky_snake PRIVATE software/cpu/include)
target_compile_features(sneaky_snake PRIVATE cxx_std_17)
target_link_libraries(sneaky_snake PRIVATE OpenMP::OpenMP_CXX)
