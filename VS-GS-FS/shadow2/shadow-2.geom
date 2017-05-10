#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat4 modelViewProjectionMatrixInverse;
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
    for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vec4(0);
		vec4 aux = modelViewProjectionMatrixInverse*gl_in[i].gl_Position;
		aux.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*aux;
		EmitVertex();
	}
    EndPrimitive();
    
    if(gl_PrimitiveIDIn == 0) {
        vec3 C = (boundingBoxMax + boundingBoxMin)/2;
        float R = distance(boundingBoxMax, boundingBoxMin)/2;
        gfrontColor = vec4(0,1,1,1); //cyan
        vec4 centre = vec4(C.x, boundingBoxMin.y-0.01, C.z, 1);
        vec4 pos1 = centre;
        pos1.x -= R; pos1.z -= R;
        gl_Position = modelViewProjectionMatrix*pos1;
        EmitVertex();
        vec4 pos2 = centre;
        pos2.z += R; pos2.x -= R;
        gl_Position = modelViewProjectionMatrix*pos2;
        EmitVertex();
        vec4 pos3 = centre;
        pos3.x += R; pos3.z -= R;
        gl_Position = modelViewProjectionMatrix*pos3;
        EmitVertex();
        vec4 pos4 = centre;
        pos4.z += R; pos4.x += R;
        gl_Position = modelViewProjectionMatrix*pos4;
        EmitVertex();
        EndPrimitive();
    }
}
