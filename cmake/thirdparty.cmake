include(FetchContent)

set(SUBDIR ${PROJECT_SOURCE_DIR}/thirdparty)

set(SUBDIR ${PROJECT_SOURCE_DIR}/thirdparty)
set(GLAD_SOURCE_DIR ${SUBDIR}/glad)
add_library(glad ${GLAD_SOURCE_DIR}/src/glad.c)
target_include_directories(glad PUBLIC ${GLAD_SOURCE_DIR}/include)

FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG 3.4
)

FetchContent_Declare(
    glew
    GIT_REPOSITORY https://github.com/nigels-com/glew.git
    GIT_TAG glew-2.2.0
)

FetchContent_Declare(
    glm
    GIT_REPOSITORY https://github.com/g-truc/glm.git
    GIT_TAG 1.0.1
)

set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(glfw glew glm)
