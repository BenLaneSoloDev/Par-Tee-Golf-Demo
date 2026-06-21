shader_type canvas_item;

uniform float thickness: hint_range(1, 100, 0.1) = 0.8;
uniform float anti_alias_amount = 1.0;
uniform vec4 color: source_color = vec4(1);

void fragment() {
	float max_distance = thickness + anti_alias_amount;
	int max_offset = int(ceil(max_distance));
	float closest_outline_distance = max_distance;
	
	for (int x = -max_offset; x <= max_offset; x++) {
		for (int y = -max_offset; y <= max_offset; y++) {
			vec2 offset = vec2(float(x), float(y));
			float dist = length(offset);
			
			if (dist > max_distance) continue;
			
			if (texture(TEXTURE, UV + offset * TEXTURE_PIXEL_SIZE).a < 1.0) {
				closest_outline_distance = min(closest_outline_distance, dist);
			}
		}
	}
	
	float alpha = 1.0 - smoothstep(thickness - anti_alias_amount, thickness + anti_alias_amount, closest_outline_distance);
	COLOR = vec4(color.rgb, alpha);
}
