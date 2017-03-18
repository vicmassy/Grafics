#version 330 core

in vec4 frontColor;
in vec3 v;
in vec3 N;
out vec4 fragColor;

uniform float epsilon = 0.1;
uniform float light = 0.5;

void main()
{
	float aux = abs(dot(normalize(v),normalize(N)));
	if (aux < epsilon) fragColor = vec4(0.7,0.6,0.0,0.0);
	else fragColor = frontColor*light*N.z;
}
