extends RigidBody2D

const THRUST = 100;
const TORQUE_THRUST = 70;
const GRAVITY = 0.045;

var prev_frame_vel;


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true;
	max_contacts_reported = 100;
	gravity_scale = GRAVITY;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_speed;

	if Input.is_action_pressed("ui_right"):
		apply_torque(TORQUE_THRUST)
	if Input.is_action_pressed("ui_left"):
		apply_torque(-TORQUE_THRUST)
	if Input.is_action_pressed("ui_up"):
		move_speed = Vector2(0, -THRUST).rotated(rotation);
		apply_central_force(move_speed)

	prev_frame_vel = linear_velocity;

func has_collision_occurred() -> bool:
	return (abs(prev_frame_vel.y) > 12 or abs(prev_frame_vel.x) > 12) or abs(rotation) > 0.05

func _on_body_entered(body):
	if body is TileMap and has_collision_occurred():
		print("Crashed!")
