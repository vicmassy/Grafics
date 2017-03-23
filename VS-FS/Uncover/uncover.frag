#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 V_NDC;
uniform float time;


void main()
{
	if (V_NDC.x + 1 <= time) fragColor = vec4(0.0,0.0,1.0,0.0);
	else discard;
}
