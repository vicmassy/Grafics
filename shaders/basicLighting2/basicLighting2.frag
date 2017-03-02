#version 330 core

in vec3 colorFS;
in vec3 N;

out vec4 fragColor;

void main()
{
    fragColor = vec4(colorFS,1.0) * normalize(N).z;
}
