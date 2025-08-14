#ifndef __MAIN_H__
#define __MAIN_H__

#include <glad/glad.h>
#include <GLFW/glfw3.h>

constexpr uint16_t WINDOW_WIDTH = 800;
constexpr uint16_t WINDOW_HEIGHT = 800;

static const char *vertex_shader_src = R"(
#version 400 core
layout (location = 0) in vec3 aPos;
void main() {
    gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);
}
)";

static const char *fragment_shader_src = R"(
#version 400 core
out vec4 frag_color;
void main() {
    frag_color = vec4(1.0f, 0.5f, 0.2f, 1.0f);
}
)";

typedef struct {
    unsigned int vao;
    unsigned int vbo;
} Mesh;

unsigned int compile_shader(GLenum type, const char *source);
unsigned int create_shader_program(const char *vertex_src,
                                   const char *fragment_src);
Mesh create_mesh(const float *vertices, size_t vertex_count);
void destroy_mesh(Mesh mesh);

#endif // !__MAIN_H_f_
