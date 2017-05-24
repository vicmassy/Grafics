#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 N[];
out vec4 gfrontColor;

uniform float disp = 0.05;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 projectionMatrix;

void main( void ) {
    vec3 bar = (gl_in[0].gl_Position.xyz + gl_in[1].gl_Position.xyz + gl_in[2].gl_Position.xyz)/3;
    vec3 normal = (N[0]+N[1]+N[2])/3;
    bar += normal*disp;
    

	gfrontColor = vfrontColor[0]*N[0].z;
	gl_Position = projectionMatrix*gl_in[0].gl_Position;
	EmitVertex();
	gfrontColor = vfrontColor[1]*N[1].z;
	gl_Position = projectionMatrix*gl_in[1].gl_Position;
	EmitVertex();
	gfrontColor = vec4(1);
	gl_Position = projectionMatrix*vec4(bar, 1.0);
	EmitVertex();
    EndPrimitive();
    
    gfrontColor = vfrontColor[0]*N[0].z;
	gl_Position = projectionMatrix*gl_in[0].gl_Position;
	EmitVertex();
	gfrontColor = vfrontColor[2]*N[2].z;
	gl_Position = projectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	gfrontColor = vec4(1);
	gl_Position = projectionMatrix*vec4(bar, 1.0);
	EmitVertex();
    EndPrimitive();
    
    gfrontColor = vfrontColor[2]*N[2].z;
	gl_Position = projectionMatrix*gl_in[2].gl_Position;
	EmitVertex();
	gfrontColor = vfrontColor[1]*N[1].z;
	gl_Position = projectionMatrix*gl_in[1].gl_Position;
	EmitVertex();
	gfrontColor = vec4(1);
	gl_Position = projectionMatrix*vec4(bar, 1.0);
	EmitVertex();
    EndPrimitive();
}
