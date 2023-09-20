extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport: Window = get_viewport();

	position.x = viewport.size.x / 2 - (size.x / 2);
	position.y = viewport.size.y / 2 - (size.y / 2);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
