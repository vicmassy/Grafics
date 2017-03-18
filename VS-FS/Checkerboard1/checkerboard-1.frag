#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;

void main()
{
	float x = vtexCoord.s*8;
	float y = vtexCoord.t*8;
	if(int(x) % 2 != 0) {
		if(int(y) % 2 == 0)
			fragColor = vec4(0);
		else
			fragColor = vec4(0.8);
	}
	else {
		if(int(y) % 2 != 0)
			fragColor = vec4(0);
		else
			fragColor = vec4(0.8);
	}

}
