extends Line2D

@onready
var rocket: RigidBody2D = get_parent();
var can_update: bool = true;

const MAX_POINTS: int = 5000;
const WIDTH: int = 2;

# Called when the node enters the scene tree for the first time.
func _ready():
	antialiased = true;
	width = WIDTH;

func update_trajectory(delta: float) -> void:
	var terrain: TileMap;
	var gravity: float;
	var pos: Vector2;
	var cur_vel: Vector2;

	if not can_update:
		return

	cur_vel = Vector2.ZERO;

	terrain = get_tree().get_nodes_in_group("terrain")[0]
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * rocket.gravity_scale
	cur_vel = rocket.get_linear_velocity()
	pos = rocket.global_position

	for pt in range(MAX_POINTS):
		add_point(to_local(pos));
		cur_vel.y += gravity * delta;
		pos += cur_vel * delta;

		# Don't perform bounds check if trajectory exceeds viewport dimensions!
		if pos.x / 4 < 0 or pos.x / 4 >= get_viewport().size.x / 4:
			continue;

		if pos.y >= terrain.height_map[floor(pos.x / 4)]:
			break;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear_points();
	update_trajectory(delta);
	show()


func _on_rocket_body_entered(body):
	can_update = false;
