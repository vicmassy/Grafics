#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
	float d = distance(vec2(0.5,0.5),vtexCoord);
	if(step(0.2, d) == 0) fragColor = vec4(1.0,0.0,0.0,0.0);
    else fragColor = vec4(1.0);
}
