#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
const float PI = 3.14159;
uniform float amplitude = 0.1;
uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(1.0,0,0,1.0);
    vtexCoord = texCoord;
	vec3 V = vertex;
	V.y = amplitude*sin(2*PI*vertex.x+3*time);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
