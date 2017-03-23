#version 330 core

in vec4 frontColor;
out vec4 fragColor;

void main()
{
	gl_FragDepth = abs(gl_FragCoord.z  - 1.0);
    fragColor = frontColor;
}
