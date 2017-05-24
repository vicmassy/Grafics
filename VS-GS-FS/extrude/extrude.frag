#version 330 core

in vec3 gnormal;
out vec4 fragColor;

uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix*gnormal);
    fragColor = vec4(0.8)*N.z;
}
