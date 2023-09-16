extends Node2D

var pixel_size: int = 4;

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_viewport();
	var size = viewport.size;
	viewport.size = Vector2i(size.x*pixel_size, size.y*pixel_size);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
