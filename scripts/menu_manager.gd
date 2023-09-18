extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/MainMenu/VBoxContainer/StartButton.grab_focus();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass;

func _on_main_ready_done():
	var viewport: Window;
	var center_container: CenterContainer;
	var main_menu: Control;
	var vbox: VBoxContainer;
	

	# Hardcode for now
	viewport = get_viewport();

	center_container = get_children()[0];
	center_container.position.x = viewport.size.x / 2;
	center_container.position.y = viewport.size.y / 2;
	
#
#	#child.anchors_preset = Control.PRESET_CENTER;
#	#child.set_anchors_preset(Control.PRESET_CENTER)
	main_menu = center_container.get_children()[0]
	main_menu.anchor_left = 0.5;
	main_menu.anchor_right = 0.5;
	main_menu.anchor_top = 0.5;
	main_menu.anchor_bottom = 0.5;
	
#	main_menu.margin_left = 100;
#	main_menu.margin_right = 100;
#	main_menu.margin_top = 100;
#	main_menu.margin_bottom = 100;
	
#
#	child.position.x = viewport.size.x / 2;
#	child.position.y = viewport.size.y / 2;
#	#print(child.position)
#
#	var menu = child.get_children()[0];
#	menu.position.x = viewport.size.x / 2;
#	menu.position.y = viewport.size.y / 2;
#
#	#child.size.x = viewport.size.x;
#	#child.size.y = viewport.size.y;
#
#	#child.size_flags_vertical = Control.SIZE_EXPAND_FILL;
#
#	var vbox = child.get_children();
#	if not vbox is VBoxContainer:
#		continue
#
#	child.size = vbox.size
#	#vbox.set_anchors_preset(Control.PRESET_CENTER)
#	#vbox.set_alignment(0)
#	#vbox.size_flags_vertical = Control.SIZE_EXPAND_FILL;
#	#vbox.position.x = viewport.size.x / 2;
#	#vbox.position.y = viewport.size.y / 2;
#	#vbox.size.x = viewport.size.x * 2;
#	#vbox.size.y = viewport.size.y * 2;
#
