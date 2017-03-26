#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D map;
uniform float time;
uniform float a = 0.5;
uniform float PI = 3.14159;

void main()
{
	float red = texture(map,vtexCoord).r;
	float green = texture(map,vtexCoord).g;
	float blue = texture(map,vtexCoord).b;
	float m = max(red,green);
	m = max(m,blue);
	vec2 u = vec2(m,m);
	float angle = 2*PI*time;
	mat2 rot;
	rot[0] = vec2(cos(angle),-sin(angle));
	rot[1] = vec2(sin(angle), cos(angle));
	u = rot*u;
	vec2 offset = (a/100.0)*u;
    fragColor = texture(map,vtexCoord+offset);
}
