extends Node2D

var tile_size: float;

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_viewport().size)
	get_viewport().size = Vector2i(800, 600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
