#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 V;
in vec3 N;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;
uniform bool world;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

vec4 light(vec3 N, vec3 V, vec3 L)
{
	N=normalize(N); V=normalize(V); L=normalize(L);
	vec3 R = normalize( 2.0*dot(N,L)*N-L );
	float NdotL = max( 0.0, dot( N,L ) );
	float RdotV = max( 0.0, dot( R,V ) );
	float Idiff = NdotL;
	float Ispec = 0;
	if (NdotL>0) Ispec=pow( RdotV, matShininess );
	return
	matAmbient * lightAmbient +
	matDiffuse * lightDiffuse * Idiff+
	matSpecular * lightSpecular * Ispec;
}

void main()
{
	vec3 N2 = normalize(normalMatrix*N);
	vec3 V2 = normalize(modelViewMatrix*vec4(V,1.0)).xyz;
	vec3 L = (lightPosition - vec4(V2,1.0)).xyz;
    fragColor = light(N2,-V2,L);
}
