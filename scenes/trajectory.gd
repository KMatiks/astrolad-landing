extends Line2D

@onready
var rocket = get_parent();
var prev_vel = Vector2.ZERO;
var cur_vel = Vector2.ZERO;
const MAX_POINTS = 5000

# Called when the node enters the scene tree for the first time.
func _ready():
	antialiased = true;
	width = 2;

func update_trajectory(delta: float) -> void:
	clear_points();
	var gravity = rocket.gravity_scale;
	cur_vel = rocket.get_linear_velocity()# * rocket.global_transform.x;
#	var acceleration = Vector2((cur_vel.x - prev_vel.x) / delta, (cur_vel.y - prev_vel.y) / delta);
	var pos = rocket.global_position
	for pt in range(MAX_POINTS):
		cur_vel.y += gravity;
		pos += cur_vel * delta;
		add_point(to_local(pos));

#		if pos.y > rocket.position.y - 25:
#			break

	prev_vel = cur_vel;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var heading_in_degrees = rad_to_deg(rocket.rotation);
	update_trajectory(delta);
	show()
