#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform float speed = 1.0;
uniform float time;

void main( void ) {
    float t = mod(time,2.0/speed);
    float f = fract(time*speed);
    if(f > 0.5) f = 1.0 - f;
    f *= 2;
    vec4 bar = (gl_in[0].gl_Position+gl_in[1].gl_Position+gl_in[2].gl_Position)/3;
    if(t >= 0 && t < 1.0/speed) {
        if(gl_PrimitiveIDIn%2 == 0) { 
	        for( int i = 0 ; i < 3 ; i++ ) {
		        gfrontColor = vfrontColor[i];
		        gl_Position = gl_in[i].gl_Position;
		        EmitVertex();
	        }
            EndPrimitive();
        }
        else {
            for( int i = 0 ; i < 3 ; i++ ) {
		        gfrontColor = vfrontColor[i];
		        vec4 dir = bar - gl_in[i].gl_Position;
		        gl_Position = gl_in[i].gl_Position+dir*f;
		        EmitVertex();
	        }
            EndPrimitive();
            
        }
    }
    else {
        if(gl_PrimitiveIDIn%2 != 0) {
	        for( int i = 0 ; i < 3 ; i++ ) {
		        gfrontColor = vfrontColor[i];
		        gl_Position = gl_in[i].gl_Position;
		        EmitVertex();
	        }
            EndPrimitive();
        }
        else {
            for( int i = 0 ; i < 3 ; i++ ) {
		        gfrontColor = vfrontColor[i];
		        vec4 dir = bar - gl_in[i].gl_Position;
		        gl_Position = gl_in[i].gl_Position+dir*f;
		        EmitVertex();
	        }
            EndPrimitive();
            
        }
    }
}
