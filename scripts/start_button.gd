extends Button

const DEFAULT_VIEWPORT_DIM: Vector2 = Vector2(160, 144);
const PIXEL_SIZE: int = 4;

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Start"
	toggle_mode = true;
	var viewport = get_viewport();
	viewport.size = DEFAULT_VIEWPORT_DIM;
	var size = viewport.size;
	viewport.size = Vector2i(size.x*PIXEL_SIZE, size.y*PIXEL_SIZE);



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	print("pressed");
