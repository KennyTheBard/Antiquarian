extends Node2D

# size of one tile in game space units
var tile_size = 1

# how many sprites have to be loaded
var tile_loading_zone = 10

# possible types of tiles to be cloned
var tiles_types = []

# map of the entire game world in tile ids
var map = []

# active tiles moved around to display the world's ground
var tilemap = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# generate the tilemap used to display ground
func generate_map():
	var texture_size = Vector2(tile_size, tile_size)
	for x in range(tile_loading_zone):
		tilemap.append([])
		for y in range(tile_loading_zone):
			var tile = load('res://Nodes/Tile.tscn')
			tile.set_scale(texture_size)
			tilemap[x].append(tile)
	pass


# shifts first/last row/collum of tilemap to
# the end/begining of the grid and retexture
# them to match the world map tile code
func shift():
	# TODO
	pass