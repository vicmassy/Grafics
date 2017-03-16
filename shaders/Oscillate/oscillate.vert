#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform bool eyespace;
uniform float time;

const float PI = 3.14159;

void main()
{
	float r = distance(boundingBoxMax,boundingBoxMin)/2.0;
	float y;
	if (eyespace) y = (modelViewProjectionMatrix * vec4(vertex, 1.0)).y;
	else y = vertex.y;
	float d = (r/10)*y;
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
	vec3 V = vertex + normal*d*sin(2*PI+time);
	gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
    
}
