extends ColorRect

var viewport: Window;

# Called when the node enters the scene tree for the first time.
func _ready():
	var main = get_tree().get_nodes_in_group("main")
	if len(main) > 0:
		main = main[0]
		main.connect("ready_done", _on_main_ready_done);

	viewport = get_viewport();
	size.x = viewport.size.x;
	size.y = viewport.size.y;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;

func _on_main_ready_done() -> void:
	pass
#	viewport = get_viewport();
#	size.x = viewport.size.x;
#	size.y = viewport.size.y;
