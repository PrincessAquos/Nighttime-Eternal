shader_type canvas_item;

uniform bool draw_outline;
uniform vec4 outline_color : hint_color;

void fragment() {
	float width = 1.0*TEXTURE_PIXEL_SIZE.x;
	vec4 sprite_color = texture(TEXTURE, UV);
	float alpha = -4.0 * sprite_color.a;
	vec4 final_color = sprite_color;
	if (draw_outline && sprite_color.a == 0.0) {
		alpha += texture(TEXTURE, UV + vec2(width, 0.0)).a;
		alpha += texture(TEXTURE, UV + vec2(-width, 0.0)).a;
		alpha += texture(TEXTURE, UV + vec2(0.0, width)).a;
		alpha += texture(TEXTURE, UV + vec2(0.0, -width)).a;
		
		final_color = mix(sprite_color, outline_color, 1.0);
	}
	COLOR = vec4(final_color.rgb, clamp(abs(alpha) + sprite_color.a, 0.0, 1.0));
}