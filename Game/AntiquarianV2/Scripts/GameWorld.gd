extends Spatial

# the size a tile texture has to be scaled to
var tile_size = Vector3(5.12, 0, 5.12)

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
	terrain.append(load("res://Scenes/Tiles/Water.tscn"))
	terrain.append(load("res://Scenes/Tiles/Grass.tscn"))
	terrain.append(load("res://Scenes/Tiles/Rocky.tscn"))
	terrain.append(load("res://Scenes/Tiles/Hay.tscn"))
	terrain.append(load("res://Scenes/Tiles/Mud.tscn"))
	
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
	for i in range(size):
		for j in range(size):
			var tile = terrain[world[i][j]].instance()
			# PROBLEMA: ultima textura incarcata e textura setata pentru toate
#			tile.texture = terrain[world[i][j]]
			tile.translation = Vector3(i, 0, j) * tile_size
			$TileManager.add_child(tile)
	
	# prepare prop list
	var props = []
	props.append(load("res://Scenes/Props/Tree.tscn"))
	props.append(load("res://Scenes/Props/Rock.tscn"))
	props.append(load("res://Scenes/Props/Reeds.tscn"))
	props.append(load("res://Scenes/Props/Berrybush.tscn"))
	
	# add props to the game world
	for i in range(size):
		for j in range(size):
				var chance = randi() % 100

				if chance > 80 and world[i][j] > 0:
					# pick props depending on the terrain
					var prop = props[world[i][j] - 1].instance()
					
					# placing the props in the world
					prop.translation = Vector3(i, 0, j) * tile_size

#					# enable billboarding and set the required flags
#					var material = SpatialMaterial.new()
#					material.set_billboard_mode(SpatialMaterial.BILLBOARD_ENABLED)
#					material.flags_transparent = true
#					material.params_billboard_keep_scale = true
#					prop.get_node("./Sprite").set_material_override(material)
					
					$ObjectManager.add_child(prop)
	
	$Player.translation = tile_size * size / 2
	
	pass
