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

const vec4 red = vec4(1,0,0,0);
const vec4 yellow = vec4(1,1,0,0);
const vec4 green = vec4(0,1,0,0);
const vec4 cian = vec4(0,1,1,0);
const vec4 blue = vec4(0,0,1,0);


void main()
{

	float minY = boundingBoxMin.y; 
	float maxY = boundingBoxMax.y;

    vec3 N = normalize(normalMatrix * normal);
	float y = ((vertex.y-minY)/(maxY-minY))*4;
	if (y < 1) frontColor = mix(red,yellow,fract(y));
	else if (y < 2) frontColor = mix(yellow,green,fract(y));
	else if (y < 3) frontColor = mix(green,cian,fract(y));
	else if (y < 4) frontColor = mix(cian,blue,fract(y));
	else frontColor = blue;
    
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
