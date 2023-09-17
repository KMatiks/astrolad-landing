extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_ready_done():
	var viewport = get_viewport();
	var children = get_children();

	# should probably have typecheck here but whatever ¯\_(ツ)_/¯
	for child in children:
		child.size.x = viewport.size.x;
		child.size.y = viewport.size.y;


