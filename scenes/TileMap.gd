extends TileMap

@onready
var viewport = get_viewport()

func draw_tile(pos):
	var atlas = Vector2(randi_range(0,3), randi_range(0,3))
	var surface_tile = Vector2i(atlas.x, atlas.y);
	set_cell(0, Vector2i(pos.x, pos.y), 0, surface_tile)

func gen_terrain():
	randomize()
	var noise = FastNoiseLite.new()
	var max_num_stacked_tiles = (viewport.size.y / tile_set.tile_size.y)

	noise.seed = randi()

	for x in range(0, viewport.size.x / tile_set.tile_size.x):
		var tiles_to_draw = max(ceil(abs(noise.get_noise_1d(x)) * max_num_stacked_tiles), 1)
		for y in range(0, tiles_to_draw):
			draw_tile(Vector2(x, max_num_stacked_tiles - y - 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	gen_terrain()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass