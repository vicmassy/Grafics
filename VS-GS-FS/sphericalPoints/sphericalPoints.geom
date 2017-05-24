#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec2 gtexCoord;

uniform float side = 0.1;
uniform mat4 projectionMatrix;

void main( void ) {
	vec4 centre = gl_in[0].gl_Position;
	float mside = side/2.0;
	
	gtexCoord = vec2(0.0,1.0);
	gl_Position = projectionMatrix*(centre + vec4(-mside,mside,0,0));
	EmitVertex();
	
	gtexCoord = vec2(1.0,1.0);
	gl_Position = projectionMatrix*(centre + vec4(mside,mside,0,0));
	EmitVertex();
	
	gtexCoord = vec2(0.0,0.0);
	gl_Position = projectionMatrix*(centre + vec4(-mside,-mside,0,0));
	EmitVertex();
	
	gtexCoord = vec2(1.0,0.0);
	gl_Position = projectionMatrix*(centre + vec4(mside,-mside,0,0));
	EmitVertex();
    EndPrimitive();
}
