cmake_minimum_required(VERSION 3.15)
project(OpenGLProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

include(thirdparty)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    add_compile_options(-Wall -Wextra -pedantic -pipe)
    add_compile_options("$<$<CONFIG:Debug>:-g3;-Og>")
    add_compile_options("$<$<CONFIG:Release>:-D_FORTIFY_SOURCE=2;-fstack-protector-strong;-fPIE;-fPIC>")
    add_compile_options("$<$<CONFIG:Release>:-O3;-ffast-math;-march=native>")
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    add_compile_options(/W4 /WX /permissive-)
    add_compile_options("$<$<CONFIG:Debug>:/Zi;/Od;/RTC1>")
    add_compile_options("$<$<CONFIG:Release>:/O2;/fp:fast;/GL;/Gy>")
    add_compile_definitions( "$<$<CONFIG:Release>:_CRT_SECURE_NO_WARNINGS;_SCL_SECURE_NO_WARNINGS;NOMINMAX>")
    add_link_options("$<$<CONFIG:Release>:/DYNAMICBASE;/NXCOMPAT;/GUARD:CF>")
endif()

add_executable(${PROJECT_NAME} 
    src/main.cpp
    src/triangle.cpp
)

add_library(glad STATIC ${glad_SOURCE_DIR}/src/glad.c)
target_include_directories(glad PUBLIC ${glad_SOURCE_DIR}/include)
target_compile_options(glad PRIVATE -w)

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${PROJECT_SOURCE_DIR}/include
    ${PROJECT_SOURCE_DIR}/src
)

find_package(OpenGL REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE
    glad
    glfw
    glm::glm
    OpenGL::GL
)
