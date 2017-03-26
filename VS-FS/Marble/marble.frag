#version 330 core

out vec4 fragColor;
in vec3 N;
in vec3 V;

vec4 white = vec4(1);
vec4 redish = vec4(0.5,0.2,0.2,1.0);

uniform sampler2D noise;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) {
	vec3 lightPos = vec3(0.0,0.0,2.0);
	vec3 L = normalize( lightPos - Pos );
	vec3 V = normalize( -Pos);
	vec3 R = reflect(-L,N);
	float NdotL = max( 0.0, dot( N,L ) );
	float RdotV = max( 0.0, dot( R,V ) );
	float Ispec = pow( RdotV, 20.0 );
	return diffuse * NdotL + Ispec;
}

void main()
{
	vec4 sPlane = 0.3*vec4(0,1,-1,0);
	vec4 tPlane = 0.3*vec4(-2,-1,1,0);
	float s = dot(vec4(V,1.0),sPlane);
	float t = dot(vec4(V,1.0), tPlane);
	
	float v = texture(noise,vec2(s,t)).r;
	vec4 difos;
	if(v < 0.5) difos = mix(white,redish,v*2);
	else difos = mix(redish, white, (v-0.5)*2);
	
	vec3 norm = normalize(normalMatrix*N);
	vec3 pos = normalize(modelViewMatrix*vec4(V,1.0)).xyz;
    fragColor = shading(norm,pos,difos);
	
}
