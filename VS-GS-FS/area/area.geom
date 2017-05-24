#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;

uniform mat4 projectionMatrix;
const float areamax = 0.0005;
const vec4 red = vec4(1.0,0.0,0.0,1.0);
const vec4 yellow = vec4(1.0,1.0,0.0,1.0);

void main( void ) {

    vec3 U = gl_in[1].gl_Position.xyz-gl_in[0].gl_Position.xyz;
    vec3 V = gl_in[2].gl_Position.xyz-gl_in[0].gl_Position.xyz;
    float area = length(cross(U,V))/(2.0*areamax);
    vec4 gcolor = mix(red,yellow,area);
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = gcolor;
		gl_Position = projectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}
