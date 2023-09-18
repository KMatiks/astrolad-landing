extends Camera2D

@onready var viewport: Window = get_viewport()
@onready var rocket: RigidBody2D = get_tree().get_nodes_in_group("rocket")[0];
@onready var sprite: Sprite2D = get_parent().get_child(1);
@onready var sprite_height: int = sprite.texture.get_height();

# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = 0;
	limit_right = viewport.size.x * 4;
	limit_top = 0;
	limit_bottom = viewport.size.y * 4;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;
#	if rocket.global_position.y - sprite_height <= 0:
#		limit_top = rocket.global_position.y - sprite_height + 5;
#	else:
#		limit_top = 0;
