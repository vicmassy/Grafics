#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

uniform int textureSize = 1024;
uniform int edgeSize = 2;
uniform float threshold = 0.1;
uniform sampler2D tex;

void main()
{
	vec2 left = vtexCoord+edgeSize*vec2(-1,0)/textureSize;
	vec2 right = vtexCoord+edgeSize*vec2(1,0)/textureSize;
	vec2 bot = vtexCoord+edgeSize*vec2(0,-1)/textureSize;
	vec2 top = vtexCoord+edgeSize*vec2(0,1)/textureSize;
	float GX = length(texture(tex,right) - texture(tex,left));
	float GY = length(texture(tex,top) - texture(tex,bot));
	float d = length(vec2(GX,GY));
	if (d > threshold) fragColor = vec4(0);
    else fragColor = texture(tex,vtexCoord);
}
