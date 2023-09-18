extends RigidBody2D


const THRUST: int = 100;
const TORQUE_THRUST: int = 70;
const GRAVITY_SCALE: float = 0.045;

var prev_frame_vel: Vector2;
var is_accepting_input: bool = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true;
	max_contacts_reported = 100;
	gravity_scale = GRAVITY_SCALE;

# Handles out of bounds collisions
func has_oob_collision_occurred() -> bool:
	return global_position.y >= get_viewport().size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_speed: Vector2;

	if not is_accepting_input:
		return

	if has_oob_collision_occurred():
		print("Crashed");
		freeze = true;
		return;

	if Input.is_action_pressed("ui_right"):
		apply_torque(TORQUE_THRUST)
	if Input.is_action_pressed("ui_left"):
		apply_torque(-TORQUE_THRUST)
	if Input.is_action_pressed("ui_up"):
		move_speed = Vector2(0, -THRUST).rotated(rotation);
		apply_central_force(move_speed)

	prev_frame_vel = linear_velocity;

func has_collision_occurred() -> bool:
	return (abs(prev_frame_vel.y) > 15 or abs(prev_frame_vel.x) > 15) or abs(rotation) > 0.05

# Handles in-bounds collisons
func _on_body_entered(body):
	is_accepting_input = false;

	if not body is TileMap:
		return;

	if has_collision_occurred():
		print("Crashed w/ velocity: ", prev_frame_vel)
		return;

	print("Successful landing!")
