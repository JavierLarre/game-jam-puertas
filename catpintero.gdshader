shader_type canvas_item;

uniform float time_speed = 1.0;
uniform float pastel_shift = 0.1;
uniform float outer_glow_strength = 0.1;
uniform float sparkle_speed = 8.0;

void fragment() {
    vec2 uv = UV;

    // Get the base pixel
    vec4 tex = texture(TEXTURE, uv);

    // Time-based pastel tint shifting (soft hue waves)
    float hue_wave = sin(TIME * time_speed + uv.y * 5.0) * pastel_shift;
    vec3 pastel = tex.rgb + vec3(hue_wave, hue_wave * 0.5, -hue_wave * 0.3);

    // Fake sparkles: little white noise flicker, localized
    float sparkle = sin((uv.x + uv.y + TIME * sparkle_speed) * 60.0) * 0.5 + 0.5;
    sparkle = step(0.98, sparkle); // Only sparkle when high
    pastel += sparkle * 0.2;

    // Gentle glow at edges (based on alpha falloff)
    float edge = smoothstep(0.0, 0.1, tex.a);
    float glow = (1.0 - edge) * outer_glow_strength;

    COLOR = vec4(pastel + glow, tex.a);
}
