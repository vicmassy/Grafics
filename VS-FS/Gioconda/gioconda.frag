#version 330 core

in vec4 frontColor;
out vec4 fragColor;
uniform float time;
uniform sampler2D sampler;

in vec2 vtexCoord;

void main()
{
	if (fract(time) <= 0.5) fragColor = texture(sampler,vtexCoord);
	else {
		if(length(vtexCoord - vec2(0.393,0.652)) <= 0.025) {
			vec2 aux;
			aux.s = vtexCoord.s + 0.057;
			aux.t = vtexCoord.t - 0.172;
			fragColor = texture(sampler, aux);	
		}
		else fragColor = texture(sampler,vtexCoord);
	}
}
