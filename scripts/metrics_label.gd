extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	add_theme_font_size_override("font_size", 13)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rocket = get_tree().get_nodes_in_group("rocket")[0]
	var viewport = get_viewport().size
	position = Vector2(viewport.x / 1.80, viewport.y / 13)
	var format_str = "Angular Velocity:\n%f\nLinear Velocity:\n%f, %f\nOrientation:\n%s°"
	text = format_str % [
		rocket.get_angular_velocity(),
		rocket.get_linear_velocity().x,
		rocket.get_linear_velocity().y,
		rad_to_deg(rocket.rotation)]
