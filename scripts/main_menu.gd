extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport: Window = get_viewport();

	size.x = viewport.size.x;
	size.y = viewport.size.y;

	position.x = 0#viewport.size.x / 2 - ($MainMenuContainer.size.x / 2);
	position.y = 0#viewport.size.y / 2 - ($MainMenuContainer.size.y / 2);

	SignalBus.has_transitioned_to_main_menu = true;

	$MainMenuContainer/StartButton.grab_focus();
	$filter/gameboy_filter.material.set_shader_parameter("do_pixelation", false);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
