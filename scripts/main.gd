extends Node2D

# Main is the source of truth for core gameplay values!

const MAX_FPS: int = 60;
const DEFAULT_VIEWPORT_DIM: Vector2 = Vector2(160, 144);
const PIXEL_SIZE: int = 4;
var VIEWPORT_MODIFIER: Vector2i = Vector2i(PIXEL_SIZE, PIXEL_SIZE);

signal ready_done;

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = MAX_FPS;
	var viewport = get_viewport();
	viewport.size = DEFAULT_VIEWPORT_DIM;
	var size = viewport.size;
	viewport.size = VIEWPORT_MODIFIER * viewport.size;
	$Filter/gameboy_filter.material.set_shader_parameter("do_pixelation", true);
	emit_signal("ready_done");

	if not SignalBus.has_transitioned_to_main_menu:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
