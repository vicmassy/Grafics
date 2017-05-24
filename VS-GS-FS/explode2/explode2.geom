#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vvertex[];
in vec3 vnormal[];
out vec4 gfrontColor;

uniform float time;
uniform float speed = 1.2;
uniform float angSpeed = 8.0;
uniform mat4 modelViewProjectionMatrix;

void main(void) {
    vec3 baricentre = (vvertex[0] + vvertex[1 ] + vvertex[2])/3;
    vec3 n = (vnormal[0] + vnormal[1] + vnormal[2])/3;
    
    float a = time*angSpeed;
    mat3 Rz = mat3(vec3(cos(a), sin(a), 0),
                    vec3(-sin(a), cos(a), 0),
                    vec3(0,0,1));
	for(int i = 0 ; i < 3 ; i++) {
		gfrontColor = vfrontColor[i];
		vec3 V = vvertex[i] - baricentre; // Portar al origen
		V = Rz * V;
		V += baricentre+(n*time*speed);
		gl_Position = modelViewProjectionMatrix*vec4(V, 1.0);
		EmitVertex();
	}
    EndPrimitive();
}
