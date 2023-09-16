shader_type canvas_item;

uniform vec4 lightest = vec4( 0.878431, 0.972549, 0.815686, 1 );
uniform vec4 light = vec4( 0.533333, 0.752941, 0.439216, 1 );
uniform vec4 dark = vec4( 0.203922, 0.407843, 0.337255, 1 );
uniform vec4 darkest = vec4( 0.0313726, 0.0941176, 0.12549, 1 );

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

float rgb2gray(vec4 color) {
        return 0.299*color.r + 0.587*color.g + 0.114*color.b;
}

void fragment() {
        COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
        float gray_val = rgb2gray(COLOR);
        
        if (gray_val < 0.25)
                COLOR = darkest;
        else if (gray_val < 0.50)
                COLOR = dark;
        else if (gray_val < 0.75)
                COLOR = light;
        else
                COLOR = lightest;
}