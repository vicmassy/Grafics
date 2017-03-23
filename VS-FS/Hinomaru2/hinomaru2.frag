#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform bool classic;
uniform float PI = 3.14159;

void main()
{
    if(classic) {
		float d = distance(vec2(0.5,0.5),vtexCoord);
		if(step(0.2, d) == 0) fragColor = vec4(1.0,0.0,0.0,0.0);
    	else fragColor = vec4(1.0);
	}
	else {
		vec2 u = vtexCoord - vec2(0.5,0.5);
		float d = distance(vec2(0.5,0.5),vtexCoord);
		float angle = atan(u.t,u.s);
		if(mod(angle/(PI/16)+0.5,2) < 1) fragColor = vec4(1.0,0.0,0.0,0.0);
		else if(step(0.2, d) == 0) fragColor = vec4(1.0,0.0,0.0,0.0);
		else fragColor = vec4(1.0);
	}
}
