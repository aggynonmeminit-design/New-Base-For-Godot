shader_type canvas_item;

uniform vec2 scroll_speed = vec2(0.1, 0.2);
uniform float scale = 1.0;
varying vec4 modulate;

void vertex(){
	modulate = COLOR;
}
void fragment() {
    vec2 st = UV * scale + (scroll_speed * TIME);
    COLOR = texture(TEXTURE, fract(st)) * modulate;
}
