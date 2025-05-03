shader_type canvas_item;

uniform float time_speed = 5.0;
uniform float wobble_strength = 0.05;
uniform float rgb_split = 0.02;

void fragment() {
    vec2 uv = UV;

    float offset = sin(TIME * time_speed + uv.y * 20.0) * wobble_strength;

    vec2 r_uv = uv + vec2(offset + rgb_split, 0.0);
    vec2 g_uv = uv + vec2(offset, 0.0);
    vec2 b_uv = uv + vec2(offset - rgb_split, 0.0);

    vec4 col_r = texture(TEXTURE, r_uv);
    vec4 col_g = texture(TEXTURE, g_uv);
    vec4 col_b = texture(TEXTURE, b_uv);

    // Blend the alphas from each channel
    float alpha = (col_r.a + col_g.a + col_b.a) / 3.0;

    COLOR = vec4(col_r.r, col_g.g, col_b.b, alpha);
}
