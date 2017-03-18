#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n;

void main()
{
	float x = gl_FragCoord.x;
	float y = gl_FragCoord.y;
	if (mod(y,n) != 0.5) {
		discard;
	}
    fragColor = frontColor;
}
