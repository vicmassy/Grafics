#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D explosion;
uniform float time;

in vec2 vtexCoord;

void main()
{
	float s = 1.0/8.0; 
	float t = 1.0/6.0;
	int frame = int(time*30)%48;
	int x = frame%8;
	int y = frame/8;

	vec2 offset = vec2(x*s, -t*y);
	vec2 sCoord = vec2(vtexCoord.s*s, vtexCoord.t*t) - vec2(0,t);
    fragColor = frontColor * texture(explosion, sCoord + offset);
    fragColor = fragColor.a * fragColor;
}  
