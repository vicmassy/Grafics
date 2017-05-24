#version 330 core

in vec3 vvertex;
out vec4 fragColor;

uniform sampler2D spheremap;
uniform vec4 lightPosition;

vec4 sampleSphereMap(sampler2D sampler, vec3 V) {
    float z = sqrt((V.z+1.0)/2.0);
    vec2 st = vec2((V.x/(2.0*z)+1.0)/2.0, (V.y/(2.0*z)+1.0)/2.0);
    return texture2D(sampler, st);
}

void main() {
    vec3 v = normalize(lightPosition.xyz - vvertex);
    fragColor = sampleSphereMap(spheremap,v);
}
