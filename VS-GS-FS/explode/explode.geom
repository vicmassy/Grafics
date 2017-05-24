#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
in vec3 vvertex[];
out vec4 gfrontColor;

uniform float time;
uniform mat4 modelViewProjectionMatrix;

const float speed = 0.5;

void main( void )
{
    vec3 n = vec3(0);
    for(int i = 0; i < 3; ++i) {
        n += vnormal[i];
    }
    n /= 3;
    
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		vec4 aux = vec4(vvertex[i]+(speed*n*time),1.0);
		gl_Position = modelViewProjectionMatrix*aux;
		EmitVertex();
	}
    EndPrimitive();
}
