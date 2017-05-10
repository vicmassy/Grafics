#version 330 core

in vec4 gfrontColor;
out vec4 fragColor;
in vec3 gnormal;
in vec2 gtexCoord;

uniform sampler2D lego;

vec3 findColor() {
    float r = distance(vec4(1,0,0,1), gfrontColor);
    float g = distance(vec4(0,1,0,1), gfrontColor);
    float b = distance(vec4(0,0,1,1), gfrontColor);
    float c = distance(vec4(0,1,1,1), gfrontColor);
    float y = distance(vec4(1,1,0,1), gfrontColor);
    if (r < g && r < b && r < c && r < y) return vec3(1,0,0);
    if (g < r && g < b && g < c && g < y) return vec3(0,1,0);
    if (b < g && b < r && b < c && b < y) return vec3(0,0,1);
    if (c < g && c < b && c < r && c < y) return vec3(0,1,1);
    if (y < g && y < b && y < c && y < r) return vec3(1,1,0);
}

void main()
{
    vec3 C = findColor();
    fragColor = texture(lego, gtexCoord)*vec4(C,1.0)*gnormal.z;
}
