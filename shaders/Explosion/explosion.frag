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
	int frame = int(30*time) % 48;
	float x = frame%8;
	float y = frame/8;
	vec2 Coord = vtexCoord * vec2(s,t) - vec2(0, t);
	vec2 offset = vec2(s*x, -t*y);
    fragColor = frontColor * texture(explosion, Coord + offset);
    fragColor = fragColor.a * fragColor;
}  
