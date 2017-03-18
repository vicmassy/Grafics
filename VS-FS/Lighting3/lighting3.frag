#version 330 core

in vec4 frontColor;
in vec3 N;
in vec3 V;
out vec4 fragColor;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

void main()
{
	vec3 L = normalize(lightPosition.xyz - V);
	vec3 H = normalize(vec3(0.0,0.0,1.0) + L);
	
	fragColor = matAmbient*lightAmbient+matDiffuse*lightDiffuse*max(0.0,dot(N,L))+matSpecular*lightSpecular*pow(max(0.0,dot(N,H)),matShininess);
}
