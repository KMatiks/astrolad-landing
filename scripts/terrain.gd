extends TileMap


var height_map : Array;

func draw_tile(pos) -> void:
	var atlas: Vector2;
	var surface_tile: Vector2i;

	atlas = Vector2(randi_range(0,3), randi_range(0,3))
	surface_tile = Vector2i(atlas.x, atlas.y);

	set_cell(0, Vector2i(pos.x, pos.y), 0, surface_tile)

func gen_terrain() -> void:
	var viewport: Window;
	var noise: FastNoiseLite;
	var max_num_stacked_tiles: int;
	var tiles_to_draw: int;

	randomize()

	viewport = get_viewport()
	noise = FastNoiseLite.new()
	noise.seed = randi()
	max_num_stacked_tiles = (viewport.size.y / tile_set.tile_size.y)

	for x in range(0, viewport.size.x / tile_set.tile_size.x):
		tiles_to_draw = max(ceil(clampf(abs(noise.get_noise_1d(x)), 0.10, 0.40) * max_num_stacked_tiles), 1)
		height_map.append((max_num_stacked_tiles-tiles_to_draw)*tile_set.tile_size.y)
		for y in range(0, tiles_to_draw):
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
