#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
    float x = vtexCoord.s*9;
	if (int(x)%2 == 0) fragColor = vec4(1.0,1.0,0.0,1.0);
	else fragColor = vec4(1.0,0.0,0.0,1.0);
}
