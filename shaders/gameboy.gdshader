shader_type canvas_item;

uniform vec3 lightest = vec3( 0.878431, 0.972549, 0.815686 );
uniform vec3 light = vec3( 0.533333, 0.752941, 0.439216 );
uniform vec3 dark = vec3( 0.203922, 0.407843, 0.337255 );
uniform vec3 darkest = vec3( 0.0313726, 0.0941176, 0.12549 );

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;

const vec2 res = vec2(160, 144);

float rgb2gray(vec4 color) {
        return 0.299*color.r + 0.587*color.g + 0.114*color.b;
}

void fragment() {
		//================ PIXELATION ====================
		// `res` is a const declared above representing the desired resolution: (160, 144)
		// `UV` built-in var is the normalized texture coords (range is 0 to 1)
		// Quantize `UV` to a stepped value based on the desired resolution by multiplying then flooring the coords
		// +0.5 to sample from center of the pixel
		// Using res.x or res.y shouldn't matter since we're dividing by res.x or res.y anyways
		vec2 uv = (vec2(ivec2(UV * res)) + 0.5) / res;
		vec4 tex_color = textureLod(SCREEN_TEXTURE, uv, 0); // Sample the screen texture using new coords
		// =================================================
		
		float a = tex_color.a < 0.75 ? 0.0 : 1.0; // Cancel out any anti-aliasing (shouldn't be a problem since we don't have anti-aliasing but doesn't hurt)

        float gray_val = rgb2gray(tex_color);

        if (gray_val < 0.15) // Tweak these thresholds PLEASE
                tex_color = vec4(darkest, a);
        else if (gray_val < 0.3)
                tex_color = vec4(dark, a);
        else if (gray_val < 0.6)
                tex_color = vec4(light, a);
        else
                tex_color = vec4(lightest, a);

        COLOR = tex_color;
}
