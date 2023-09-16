shader_type canvas_item;

uniform vec3 lightest = vec3( 0.878431, 0.972549, 0.815686 );
uniform vec3 light = vec3( 0.533333, 0.752941, 0.439216 );
uniform vec3 dark = vec3( 0.203922, 0.407843, 0.337255 );
uniform vec3 darkest = vec3( 0.0313726, 0.0941176, 0.12549 );

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

float rgb2gray(vec4 color) {
        return 0.299*color.r + 0.587*color.g + 0.114*color.b;
}

void fragment() {
        vec4 tex_color = texture(SCREEN_TEXTURE, SCREEN_UV);
        float gray_val = rgb2gray(tex_color);

        if (gray_val < 0.25)
                tex_color = vec4(darkest, tex_color.a);
        else if (gray_val < 0.50)
                tex_color = vec4(dark, tex_color.a);
        else if (gray_val < 0.75)
                tex_color = vec4(light, tex_color.a);
        else
                tex_color = vec4(darkest, tex_color.a);
        
        COLOR = tex_color;
}
