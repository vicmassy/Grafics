#version 330 core

in vec3 gnormal;
in vec3 gPos;
out vec4 fragColor;

uniform sampler2D grass_top, grass_side;
uniform float d = 0.1;

void main() {
    vec2 texCoord;
    if(gnormal.z == 0) {
        texCoord = vec2(4*(gPos.x-gPos.y), 1.0 - gPos.z/d);
        vec4 aux = texture(grass_side, texCoord);
        if (aux.a < 0.1) discard;
        else fragColor = aux;
    }
    else {
        texCoord = 4*gPos.xy;
        fragColor = texture(grass_top, texCoord);
    }
}
