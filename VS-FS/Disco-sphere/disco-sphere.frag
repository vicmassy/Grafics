#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform sampler2D sampler;
in vec2 vtexCoord;
in vec3 V_eye;

void main()
{
	vec3 dx = dFdx(V_eye);
	vec3 dy = dFdy(V_eye);
	vec3 normal = normalize(cross(dx, dy));
	vec2 coord = vec2(normal.x,normal.y)*normal.z;
    fragColor = texture(sampler,coord);
}
