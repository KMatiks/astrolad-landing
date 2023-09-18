extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rocket = get_tree().get_nodes_in_group("rocket")[0]
	var viewport = get_viewport().size
	position = Vector2(viewport.x / 1.90, viewport.y / 13)
	var format_str = "Angular Velocity: %f\nLinear Velocity: %s\n Orientation: %s°"
	text = format_str % [rocket.get_angular_velocity(), rocket.get_linear_velocity(), rad_to_deg(rocket.rotation)]
