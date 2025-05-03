shader_type canvas_item;

uniform vec4 target_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 base_color = vec4(0.0, 1.0, 0.0, 1.0);

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	if (distance(tex_color.rgb, base_color.rgb) < .6) {
		COLOR = vec4(target_color.rgb, tex_color.a);
	} else {
		COLOR = tex_color;
	}
}
