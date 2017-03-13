#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

const vec4 red = vec4(1,0,0,0);
const vec4 yellow = vec4(1,1,0,0);
const vec4 green = vec4(0,1,0,0);
const vec4 cian = vec4(0,1,1,0);
const vec4 blue = vec4(0,0,1,0);


void main()
{

    vec3 N = normalize(normalMatrix * normal); 
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
	float y = (gl_Position.y/gl_Position.w)*2;
	if (y < -1) frontColor = mix(red,yellow,fract(y));
	else if (y < 0) frontColor = mix(yellow,green,fract(y));
	else if (y < 1) frontColor = mix(green,cian,fract(y));
	else if (y < 2) frontColor = mix(cian,blue,fract(y));
	else frontColor = blue;
}
