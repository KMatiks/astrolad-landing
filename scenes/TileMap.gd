extends TileMap


func draw_tile(pos):
	var atlas = Vector2(randi_range(0,3), randi_range(0,3))
	var surface_tile = Vector2i(atlas.x, atlas.y);
	set_cell(0, Vector2i(pos.x, pos.y), 0, surface_tile)

func gen_terrain():
	randomize()
	var viewport = get_viewport()
	var noise = FastNoiseLite.new()
	var max_num_stacked_tiles = (viewport.size.y / tile_set.tile_size.y)

	noise.seed = randi()

	for x in range(0, viewport.size.x / tile_set.tile_size.x - 1):
		var tiles_to_draw = max(ceil(abs(noise.get_noise_1d(x)) * max_num_stacked_tiles), 1)
		for y in range(0, tiles_to_draw-1):
			draw_tile(Vector2(x, max_num_stacked_tiles - y - 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_ready_done():
	print(get_viewport().size)
	gen_terrain()
