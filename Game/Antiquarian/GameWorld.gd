extends Node2D

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
	
	var world = []
	var size = 100
	for i in range(0, size - 1):
		world.append([])
		for j in range(0, size - 1):
			world[i].append(0)
	
	var x = 0
	var y = 0
	var type = 0

	var terrain = []
	terrain.append(load("res://Assets/water_turf.jpg"))
	terrain.append(load("res://Assets/forest_turf.png"))
	terrain.append(load("res://Assets/sandy_turf.png"))
	terrain.append(load("res://Assets/rocky_turf.png"))
	terrain.append(load("res://Assets/savanna_turf.png"))
	terrain.append(load("res://Assets/mud_turf.png"))

	var zones = []
	var zones_types = []
	var num_zones = size * 10 #+ (randi() % size / 20) * sign(randi() % 3 - 1)
	for i in range(num_zones):
		#x = randi() % (size - 21) + 10
		#y = randi() % (size - 21) + 10
		x = randi() % size
		y = randi() % size
		type = randi() % len(terrain)
		zones.append(Vector2(x, y))
		zones_types.append(type)
	
	for i in range(0, size - 1, 20):
		zones.append(Vector2(i, 0))
		zones_types.append(0)
		zones.append(Vector2(i, size - 1))
		zones_types.append(0)
	
	for i in range(0, size - 1, 20):
		zones.append(Vector2(0, i))
		zones_types.append(0)
		zones.append(Vector2(size - 1, i))
		zones_types.append(0)
	
	var min_dist = 0
	var min_val = 0
	var dist = 0
	for i in range(0, size - 1):
		for j in range(0, size - 1):
			min_dist = size * size * size * size
			min_val = 0
	
			for k in range(len(zones)):
				dist = (zones[k].y - i) * (zones[k].y - i) \
					+ (zones[k].x - j) * (zones[k].x - j)
				if dist < min_dist:
					min_dist = dist
					min_val = zones_types[k]
	
			world[i][j] = min_val
	
	$TileManager.gamemap = world
	$TileManager.tiles_types = terrain
	$TileManager.active = true
	
	pass
