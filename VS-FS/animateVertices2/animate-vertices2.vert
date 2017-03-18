#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float amplitude=0.1;
uniform float freq=1;
uniform float time;
out float d;
const float PI = 3.14159;

void main()
{
	vec3 P = vertex.xyz;
    vec3 N = normalize(normalMatrix * normal);
    vtexCoord = texCoord;
    d = amplitude*sin(2*freq*PI*time+2*PI*texCoord.s);
    P = P + d*normal;
	frontColor = vec4(N.z);
    gl_Position = modelViewProjectionMatrix * vec4(P.xyz, 1.0);
}
