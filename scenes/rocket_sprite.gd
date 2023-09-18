extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var main: Node2D = get_tree().get_nodes_in_group("main")[0]
	scale.x = 1 - (1 / main.PIXEL_SIZE)
	scale.y = 1 - (1 / main.PIXEL_SIZE);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
