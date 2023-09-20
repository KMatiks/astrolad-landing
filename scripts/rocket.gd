extends RigidBody2D


const THRUST: int = 100;
const SIDE_THRUST: int = 2;
const TORQUE_THRUST: int = 70;
const GRAVITY_SCALE: float = 0.045;
const MIN_CRASH_VEL: int = 20;
const MIN_CRASH_ANGLE: float = 0.1;

@onready var viewport: Window = get_viewport();
@onready var sprite: Sprite2D = get_child(1);
@onready var sprite_width: int = sprite.texture.get_width();
@onready var left_thruster: AnimatedSprite2D = $"Sprite2D/Thrusters/Left Thruster"
@onready var right_thruster: AnimatedSprite2D = $"Sprite2D/Thrusters/Right Thruster"
var prev_frame_vel: Vector2;
var is_accepting_input: bool = true;


signal rocket_landing_failed;
signal rocket_landing_succeeded;
signal right_thruster_active;
signal left_thruster_active;
signal main_thruster_active;
signal right_thruster_inactive;
signal left_thruster_inactive;
signal main_thruster_inactive;

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true;
	max_contacts_reported = 100;
	gravity_scale = GRAVITY_SCALE;

func loop_around() -> void:
	if global_position.x <= 0:
		global_position.x = viewport.size.x
	else:
		global_position.x = 0

func is_oob() -> bool:
	return global_position.x + sprite_width <= 0 or global_position.x - sprite_width >= viewport.size.x;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_speed: Vector2;

	if is_oob():
		loop_around()

	if not is_accepting_input:
		return

	if Input.is_action_pressed("ui_right"):
		apply_force(Vector2(-SIDE_THRUST, 0), to_global(right_thruster.position));
		emit_signal(right_thruster_active.get_name())
	else:
		emit_signal(right_thruster_inactive.get_name())

	if Input.is_action_pressed("ui_left"):
		apply_force(Vector2(SIDE_THRUST, 0), to_global(left_thruster.position));
		emit_signal(left_thruster_active.get_name())
	else:
		emit_signal(left_thruster_inactive.get_name())

	if Input.is_action_pressed("ui_up"):
		move_speed = Vector2(0, -THRUST).rotated(rotation);
		apply_central_force(move_speed)
		emit_signal(main_thruster_active.get_name())
	else:
		emit_signal(main_thruster_inactive.get_name())

	prev_frame_vel = linear_velocity;

func has_collision_occurred() -> bool:
	return (abs(prev_frame_vel.y) > MIN_CRASH_VEL or abs(prev_frame_vel.x) > MIN_CRASH_VEL) or abs(rotation) > MIN_CRASH_ANGLE

func _on_body_entered(body):
	is_accepting_input = false;
	emit_signal(main_thruster_inactive.get_name())
	emit_signal(left_thruster_inactive.get_name())
	emit_signal(right_thruster_inactive.get_name())

	if not body is TileMap:
		return;

	if has_collision_occurred():
		print("Crashed w/ velocity: ", prev_frame_vel)
		emit_signal("rocket_landing_failed");
		return;

	print("Successful landing!")
	emit_signal("rocket_landing_succeeded");
