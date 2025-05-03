shader_type canvas_item;

uniform float time_speed = 2.5;
uniform float glow_strength = 0.15;
uniform float pastel_wiggle = 0.1;
uniform vec3 tint_color = vec3(1.0, 0.75, 0.9); // brighter, stronger pink

void fragment() {
    vec2 uv = UV;

    // Base texture color
    vec4 tex_color = texture(TEXTURE, uv);

    // Bigger pastel shimmer, wiggles faster
    float shimmer = sin(TIME * time_speed + uv.y * 30.0) * pastel_wiggle;
    vec3 pastel = tex_color.rgb + shimmer * tint_color;

    // Stronger centered glow effect
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(uv, center);
    float glow = smoothstep(0.5, 0.0, dist) * glow_strength;

    // Combine everything
    vec3 final_color = pastel + glow;

    // Final output
    COLOR = vec4(final_color, tex_color.a);
}