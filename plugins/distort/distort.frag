#version 330 core
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float time;
uniform float SIZE;

void main() {
    vec2 st = (gl_FragCoord.xy - vec2(0.5)) / SIZE;
    float offset = 0.01*sin(10.0*time+30.0*st.s);
    st += offset;
    fragColor = texture(colorMap, st);
}
