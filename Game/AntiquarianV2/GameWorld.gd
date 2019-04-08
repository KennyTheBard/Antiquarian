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


func create_world(world_seed) -> void:
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
	terrain.append(load("res://rocky_turf.png"))
	terrain.append(load("res://savanna_turf.png"))
	terrain.append(load("res://mud_turf.png"))
	
	# generate the voronoi diagram
	var zones = []
	var zones_types = []
	var num_zones = size * 2
	for i in range(num_zones):
		var x = randi() % (size - 10) + 5
		var y = randi() % (size - 10) + 5
		var type = randi() % (len(terrain) - 1) + 1
		zones.append(Vector2(x, y))
		zones_types.append(type)
	
	#add border water
	for i in range(0, size, 8):
		zones.append(Vector2(i, 0))
		zones_types.append(0)
		zones.append(Vector2(i, size - 1))
		zones_types.append(0)
	for i in range(0, size, 8):
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
	for i in range(size):
		for j in range(size):
				var chance = randi() % 100

				if chance > 80 and world[i][j] > 0:
					var prop = load("res://Prop.tscn").instance()
					prop.init()
					
					# pick props depending on the terrain
					match world[i][j]:
						1:
							prop.get_node("./Sprite").texture = load("res://tree.png")
						2:
							prop.get_node("./Sprite").texture = load("res://rock.png")
						3:
							prop.get_node("./Sprite").texture = load("res://reed.png")
						4:
							prop.get_node("./Sprite").texture = load("res://bush_full.png")
					var texture_size = prop.get_node("./Sprite").texture.get_size()
					
					# tweaking transformation values in order to achieve the desired result
					prop.get_node("./Sprite").scale = tile_size / Vector3(texture_size.x, texture_size.y, 1) * 0.01
					prop.get_node("./Sprite").translation = Vector3(0, texture_size.y , 0) * 0.01 \
						* prop.get_node("./Sprite").scale
					prop.translation = Vector3(i, 0, j) * tile_size * 0.01
					prop.translation += Vector3(0, 0.2, -0.1)
					prop.get_node("./Sprite").scale = Vector3(0.2, 0.2, 0.2)
					
					# enable billboarding and set the required flags
					var material = SpatialMaterial.new()
					material.set_billboard_mode(SpatialMaterial.BILLBOARD_ENABLED)
					material.flags_transparent = true
					material.params_billboard_keep_scale = true
					prop.get_node("./Sprite").set_material_override(material)
					
					$ObjectManager.add_child(prop)
	
	pass
