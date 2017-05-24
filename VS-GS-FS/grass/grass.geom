#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 vnormal[];
out vec3 gnormal;
out vec3 gPos;

uniform mat4 modelViewProjectionMatrix;
uniform float d = 0.1;

vec3 calculateNormal(vec3 A, vec3 B, vec3 C) {
    vec3 AB = B-A;
    vec3 AC = C-A;
    return cross(AB, AC);
}

void emit(vec3 V, vec3 N) {
    gPos = V;
    gnormal = N;
    gl_Position = modelViewProjectionMatrix*vec4(V, 1.0);
    EmitVertex();
}

void main( void ) {
    vec3 N = (normalize(vnormal[0]) + normalize(vnormal[1]) + normalize(vnormal[2]))/3;
    vec3 N0;
	vec3 V0 = gl_in[0].gl_Position.xyz;
	vec3 V1 = gl_in[1].gl_Position.xyz;
	vec3 V2 = gl_in[2].gl_Position.xyz;
	
	vec3 T0 = V0+d*N;
	vec3 T1 = V1+d*N;
	vec3 T2 = V2+d*N;
	
	//Bot
	N0 = -N;
	emit(V0, N0);
	emit(V1, N0);
	emit(V2, N0);
	EndPrimitive();
	
	//Left
	N0 = normalize(calculateNormal(V0, V2, T0));
	emit(V0, N0);
	emit(V2, N0);
	emit(T0, N0);
	emit(T2, N0);
	EndPrimitive();
	
	//Right
	N0 = normalize(calculateNormal(V0, V1, T0));
	emit(V0, N0);
	emit(V1, N0);
	emit(T0, N0);
	emit(T1, N0);
	EndPrimitive();
	
	//Back
	N0 = normalize(calculateNormal(V1, V2, T1));
	emit(V1, N0);
	emit(V2, N0);
	emit(T1, N0);
	emit(T2, N0);
	EndPrimitive();
}
