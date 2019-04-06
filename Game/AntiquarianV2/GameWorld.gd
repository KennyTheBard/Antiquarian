extends Spatial

# the size a tile texture has to be scaled to
var tile_size = Vector3(75, 1, 75)

# Called when the node enters the scene tree for the first time.
func _ready():
	create_world(null)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func create_world(world_seed):
	# create a seed if none is given
	if world_seed == null:
		randomize()
		world_seed = randi()
	
	# set the seed
	seed(world_seed)
	
	# prepare the world map
	var size = 30
	var world = []
	for i in range(0, size):
		world.append([])
		for j in range(0, size):
			world[i].append(0)
	
	# prepare terrain list
	var terrain = []
	terrain.append(load("res://water_turf.jpg"))
	terrain.append(load("res://forest_turf.png"))
	terrain.append(load("res://sandy_turf.png"))
	terrain.append(load("res://rocky_turf.png"))
	terrain.append(load("res://savanna_turf.png"))
	terrain.append(load("res://mud_turf.png"))
	
	# generate the voronoi diagram
	var zones = []
	var zones_types = []
	var num_zones = size * 2
	for i in range(num_zones):
		var x = randi() % (size - 5) + 5
		var y = randi() % (size - 5) + 5
		var type = randi() % (len(terrain) - 1) + 1
		zones.append(Vector2(x, y))
		zones_types.append(type)
	
	#add border water
	for i in range(0, size, 5):
		zones.append(Vector2(i, 0))
		zones_types.append(0)
		zones.append(Vector2(i, size - 1))
		zones_types.append(0)
	for i in range(0, size, 5):
		zones.append(Vector2(0, i))
		zones_types.append(0)
		zones.append(Vector2(size - 1, i))
		zones_types.append(0)
	
	# fill up the empty spaces
	for i in range(size):
		for j in range(size):
			var min_dist = size * size * size * size
			var min_val = 0
	
			for k in range(len(zones)):
				var dist = (zones[k].y - i) * (zones[k].y - i) \
					+ (zones[k].x - j) * (zones[k].x - j)
				if dist < min_dist:
					min_dist = dist
					min_val = zones_types[k]
					
			world[i][j] = min_val
	
	# set up the tile manager
	var tile_class = load("res://Tile.tscn")
	for i in range(size):
		for j in range(size):
			var tile = tile_class.instance()
#			add_child(tile)
			tile.texture = terrain[world[i][j]]
			tile.translation = Vector3(i, 0, j) * tile_size * Vector3(0.01, 0, 0.01)
			tile.scale = tile_size / Vector3(tile.texture.get_size().x, 1, tile.texture.get_size().y)
			$TileManager.add_child(tile)

	# add props to the game world
#	for i in range(size):
#		for j in range(size):
#				var chance = randi() % 100
#
#				if chance > 80 and (world[j][i] == 1 or world[j][i] == 3):
#					var prop = load("res://Nodes/Props/Prop.tscn").instance()
##					prop.get_node("./Sprite").set_scale(Vector2(50, 50) / prop.get_node("./Sprite").texture.get_size())
#					if world[j][i] == 1:
#						prop.get_node("./Sprite").texture = load("res://Assets/tree.png")
#	#					prop.get_node("./Sprite").set_scale(Vector2(75, 75) / prop.get_node("./Sprite").texture.get_size())
#
#					else:
#						prop.get_node("./Sprite").texture = load("res://Assets/rock.png")
#	#					prop.get_node("./Sprite").set_scale(Vector2(50, 50) / prop.get_node("./Sprite").texture.get_size())
#					prop.position = Vector2(i * 75, j * 75  + 30)
#
#					$ObjectManager.add(prop)
#
	pass
