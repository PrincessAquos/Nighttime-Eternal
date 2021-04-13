shader_type canvas_item;

uniform sampler2D palette;
uniform float palette_size;

void fragment() {
	// vec4 mask_color = tex(mask,UV);
	vec4 output = texture(TEXTURE, UV);
	if(output.a != 0.0)
	{
	    output = texture(palette,vec2((output.r*255.0 + 0.5)/(palette_size),0.0));
	}
	COLOR.rgba = output;
}