extends Node2D

@onready var main_thruster: AnimatedSprite2D = $"Main Thruster"
@onready var left_thruster: AnimatedSprite2D = $"Left Thruster"
@onready var right_thruster: AnimatedSprite2D = $"Right Thruster"

func _ready():
	main_thruster.play("default")
	left_thruster.play("default")
	right_thruster.play("default")

func _on_rocket_main_thruster_active():
	main_thruster.visible = true;

func _on_rocket_main_thruster_inactive():
	main_thruster.visible = false;


func _on_rocket_left_thruster_active():
	left_thruster.visible = true;


func _on_rocket_left_thruster_inactive():
	left_thruster.visible = false;


func _on_rocket_right_thruster_active():
	right_thruster.visible = true


func _on_rocket_right_thruster_inactive():
	right_thruster.visible = false
