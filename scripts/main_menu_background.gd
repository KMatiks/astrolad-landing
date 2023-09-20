extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport: Window = get_viewport();

	size.x = viewport.size.x;
	size.y = viewport.size.y;

	position.x = 0;
	position.y = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
