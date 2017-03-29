#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 V_eye;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
uniform mat4 modelViewMatrix;


void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vtexCoord = texCoord;
	float a = 0.1*time;
	mat3 rot;
	rot[0] = vec3(cos(a), 0, -sin(a));
	rot[1] = vec3(0,1,0);
	rot[2] = vec3(sin(a), 0, cos(a));
	vec3 V = rot*vertex;
	V_eye = normalize(modelViewMatrix*vec4(V,1.0)).xyz;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
