#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 vvertex[];
in vec4 vfrontColor[];
out vec2 gtexCoord;
out vec4 gfrontColor;
out vec3 gnormal;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.2;

void print(vec3 p, vec3 N, int x, int z) {
    gfrontColor = (vfrontColor[0]+vfrontColor[1]+vfrontColor[2])/3.0;
    gnormal = N;
    gtexCoord.s = x;
    gtexCoord.t = z;
    gl_Position = modelViewProjectionMatrix*vec4(p,1.0);
	EmitVertex();
}

void main( void )
{
    vec3 N;
    vec3 bar = ((vvertex[0]+vvertex[1]+vvertex[2])/3);
    bar /= step;
    bar = vec3(floor(bar.x+0.5), floor(bar.y+0.5), floor(bar.z+0.5));
    bar *= step;
	float stp = float(step)/2.0;
	
	vec3 B = bar + vec3(-stp, stp, -stp);
	vec3 C = bar + vec3(stp, stp, -stp);
	vec3 F = bar + vec3(-stp, -stp, -stp);
	vec3 G = bar + vec3(stp, -stp, -stp);
	vec3 H = bar + vec3(stp, -stp, stp);
	vec3 D = bar + vec3(stp, stp, stp);
	vec3 A = bar + vec3(-stp, stp, stp);
	vec3 E = bar + vec3(-stp, -stp, stp);
	
	N = normalMatrix*vec3(0,0,1);
	print(A,N,0,0); print(D,N,0,0); print(E, N,0,0); print(H, N,0,0);
	EndPrimitive();
	
	N = normalMatrix*vec3(0,1,0);
	print(A,N,0,0); print(D,N,0,1); print(B, N,1,0); print(C, N,1,1);
	EndPrimitive();
	
	N = normalMatrix*vec3(0,0,-1);
	print(B,N,0,0); print(C,N,0,0); print(F, N,0,0); print(G,N,0,0);
	EndPrimitive();
	
	N = normalMatrix*vec3(0,-1,0);
	print(F,N,0,0); print(G,N,0,0); print(E, N,0,0); print(H, N,0,0);
	EndPrimitive();
	
	N = normalMatrix*vec3(1,0,0);
	print(C,N,0,0); print(D,N,0,0); print(G, N,0,0); print(H, N,0,0);
	EndPrimitive();
	
	N = normalMatrix*vec3(-1,0,0);
	print(A,N,0,0); print(B,N,0,0); print(E, N,0,0); print(F, N,0,0);
	EndPrimitive();
}
