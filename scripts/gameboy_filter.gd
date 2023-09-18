extends ColorRect

# Such an ugly chain, fix later
@onready var camera: Camera2D = get_parent().get_parent().get_child(1).get_child(3);

# Called when the node enters the scene tree for the first time.
func _ready():
	var main = get_tree().get_nodes_in_group("main")[0]
	main.connect("ready_done", _on_main_ready_done);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;

func _on_main_ready_done() -> void:
	var viewport: Window;
	print(camera)
	viewport = get_viewport();
	size.x = viewport.size.x;
	size.y = viewport.size.y;
	position.x = camera.position.x;
	position.y = camera.position.y;
	print("Colored rect sz: ", size)
