extends RigidBody2D

const THRUST = 1;
const GRAVITY = 0.035;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_speed;
	gravity_scale = GRAVITY;

	if Input.is_action_pressed("ui_right"):
		apply_torque_impulse(THRUST)
	if Input.is_action_pressed("ui_left"):
		apply_torque_impulse(-THRUST)
	if Input.is_action_pressed("ui_down"):
		move_speed = Vector2(0, THRUST).rotated(rotation);
		apply_central_impulse(move_speed)
	if Input.is_action_pressed("ui_up"):
		move_speed = Vector2(0, -THRUST).rotated(rotation);
		apply_central_impulse(move_speed)
