extends Line2D

@onready
var rocket = get_parent();
const MAX_POINTS = 5000

# Called when the node enters the scene tree for the first time.
func _ready():
	antialiased = true;
	width = 2;

func update_trajectory(delta: float) -> void:
	var terrain: TileMap;
	var gravity: float;
	var pos: Vector2;
	var prev_vel: Vector2;
	var cur_vel: Vector2;

	clear_points();

	prev_vel = Vector2.ZERO;
	cur_vel = Vector2.ZERO;

	terrain = get_tree().get_nodes_in_group("terrain")[0]
	gravity = rocket.gravity_scale;
	cur_vel = rocket.get_linear_velocity()
	pos = rocket.global_position

	for pt in range(MAX_POINTS):
		add_point(to_local(pos));
		cur_vel.y += gravity;
		pos += cur_vel * delta;

		# Don't perform bounds check if trajectory exceeds viewport dimensions!
		if pos.x / 4 < 0 or pos.x / 4 >= get_viewport().size.x / 4:
			continue

		if pos.y >= terrain.height_map[floor(pos.x / 4)]:
			break;

	prev_vel = cur_vel;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_trajectory(delta);
	show()
