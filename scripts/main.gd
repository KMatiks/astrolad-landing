extends Node2D

const MAX_FPS: int = 60;
const DEFAULT_VIEWPORT_DIM: Vector2 = Vector2(160, 144);
const PIXEL_SIZE: int = 4;

signal ready_done;

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = MAX_FPS;
	var viewport = get_viewport();
	viewport.size = DEFAULT_VIEWPORT_DIM;
	var size = viewport.size;
	viewport.size = Vector2i(size.x*PIXEL_SIZE, size.y*PIXEL_SIZE);
	emit_signal("ready_done");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
