extends Label

var txt: String;

# Called when the node enters the scene tree for the first time.
func _ready():
	add_theme_font_size_override("font_size", 60)
	text = SignalBus.game_over_text;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;
