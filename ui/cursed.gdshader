shader_type canvas_item;

void fragment() {
    float t = TIME * 2.0; // faster for tacky effect
    vec3 rainbow = vec3(
        sin(t + UV.x * 10.0) * 0.5 + 0.5,
        sin(t + UV.x * 10.0 + 2.0) * 0.5 + 0.5,
        sin(t + UV.x * 10.0 + 4.0) * 0.5 + 0.5
    );

    COLOR.rgb = rainbow;
}
