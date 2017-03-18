#version 330 core

in vec3 N;
in vec3 V;

out vec4 fragColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

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
	vec3 L = normalize(lightPosition.xyz - V.xyz);
	vec3 V = normalize(-V);
	vec3 R = normalize(2*max(0.0,dot(N,L))*N-L);
	float NL = max(0.0,dot(N,L));
	float RV = max(0.0,dot(R,V.xyz));
    fragColor = matAmbient*lightAmbient+matDiffuse*lightDiffuse*NL+matSpecular*lightSpecular*pow(RV,matShininess);
}
