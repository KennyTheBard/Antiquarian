extends Node2D

# the size a tile texture has to be scaled to
var tile_size = Vector2(75, 75)

# how many shifts were made in each direction
var shifts = Vector2(0, 0)

# size of the tilemap square
var tilemap_size = 5

# how close to the border of the tilemap has the
# player to get in order to trigger a shift
var shift_border = 2

# possible types of tiles to be cloned
var tiles_types = []

# map of the entire game world in tile ids
var gamemap = []

# active tiles moved around to display the world's ground
var tilemap = []

# map position
var x = 0
var y = 0

# relative position of the observer
var xx = 0
var yy = 0

# evidence if tiles where shifted or not
var shifted = true

# flag to activate the proccess function
var active = false


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_tilemap()
			
	for i in range(tilemap_size):
		for j in range(tilemap_size):
			add_child(tilemap[i][j])
	
#	xx = (x + tilemap_size * tile_size.x) / 2
#	yy = (y + tilemap_size * tile_size.y) / 2
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not active:
		pass
	
	var speed = 120
	if Input.is_key_pressed(KEY_W):
		yy -= delta * speed
	if Input.is_key_pressed(KEY_S):
		yy += delta * speed
	if Input.is_key_pressed(KEY_A):
		xx -= delta * speed
	if Input.is_key_pressed(KEY_D):
		xx += delta * speed
	
	solve_shiftage()
	
	if shifted:
		update_tiles()
	pass


# solves the shift condition checking and updates
func solve_shiftage():
	if xx - x < shift_border * tile_size.x:
		horizontal_shift(-1)
	elif (x + 5 * tile_size.x) - xx < shift_border * tile_size.x:
		horizontal_shift(1)
	
	if yy - y < shift_border * tile_size.y:
		vertical_shift(1)
	elif (y + 5 * tile_size.y) - yy < shift_border * tile_size.y:
		vertical_shift(-1)
	
	pass


# updates the tiles position in case of any modification
func update_tiles():
	for i in range(tilemap_size):
		for j in range(tilemap_size):
			tilemap[i][j].texture = tiles_types[gamemap[i + shifts.y][j + shifts.x]]
			var size = tilemap[i][j].texture.get_size()	
			tilemap[i][j].set_scale(tile_size / size)
			tilemap[i][j].position.y = y + i * tile_size.y
			tilemap[i][j].position.x = x + j * tile_size.x
	shifted = false
	pass


# generate the tilemap used to display ground
func generate_tilemap():
	for x in range(tilemap_size):
		tilemap.append([])
		for y in range(tilemap_size):
			var tile = load('res://Nodes/Tile.tscn').instance()
			tilemap[x].append(tile)
	pass


# shifts rows of the tilemap to the required direction
# 	@direction >= 0 shift upwards
# 	@direction < 0 shift downwards
func vertical_shift(direction):
	if direction >= 0:
		tilemap.push_front(tilemap.pop_back())
		
		y -= tile_size.y
		shifts.y += -1
		shifted = true
		
	else:
		tilemap.push_back(tilemap.pop_front())
		
		y += tile_size.y
		shifts.y += 1
		shifted = true
		
	pass


# shifts columns of the tilemap to the required direction
# 	@direction >= 0 shift to right
# 	@direction < 0 shift to left
func horizontal_shift(direction):
	if direction >= 0:
		for row in tilemap:
			row.push_front(row.pop_back())
			
		x += tile_size.x
		shifts.x += 1
		shifted = true
		
	else:
		for row in tilemap:
			row.push_back(row.pop_front())
			
		x -= tile_size.x
		shifts.x += -1
		shifted = true
		
	pass