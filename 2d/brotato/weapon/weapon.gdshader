shader_type canvas_item;


uniform vec4 line_color : source_color = vec4(0, 0, 0, 1);
uniform float line_thickness : hint_range(0.0, 10.0, 0.1) = 1.0;

const vec2 OFFSET[8] = {
	vec2(-1, -1), vec2(-1, 0), vec2(-1, 1), vec2(0, -1),
	vec2(0, -1), vec2(1, -1), vec2(1, 0), vec2(1, 1)
};


void fragment() {
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;  // 描边厚度
	float outline = 0.0;

	// 向八个方向扩展原图像
	for(int i = 0; i < OFFSET.length(); i++){
		outline += texture(TEXTURE, UV + size * OFFSET[i]).a;
	}

	outline = min(outline, 1.0);

	// 混合自身颜色和描边颜色
	vec4 color = texture(TEXTURE, UV);
	COLOR = mix(color, line_color, outline - color.a);
}
