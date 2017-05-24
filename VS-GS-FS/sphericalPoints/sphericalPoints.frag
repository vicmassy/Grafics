#version 330 core

in vec2 gtexCoord;
out vec4 fragColor;

uniform sampler2D sphere;

void main()
{
    vec4 t = texture(sphere,gtexCoord);
    if (t.a != 1) discard;
    fragColor = t;
}
