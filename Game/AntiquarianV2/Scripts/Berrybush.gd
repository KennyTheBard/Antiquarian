extends "res://Scripts/Prop.gd"

# regeneration parameters
var min_ripe_time = 120
var max_ripe_time = 180
var min_drop = 1
var max_drop = 3
var ripe_time = 0
var ripe = true

# packed scene with berry
var berry = preload("res://Scenes/Items/Berry.tscn")

# the 2 sprites needed
var full = preload("res://Assets/bush_full.png")
var empty = preload("res://Assets/bush_empty.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not ripe:
		ripe_time -= delta
		if ripe_time <= 0:
			ripe_time = 0
			ripe = true

func init():
	.init()
	
	$Sprite.texture = full
	
	pass

#func interact():
#	if ripe:
#		randomize()
#		ripe = false
#		ripe_time = randi() % 120 + 180
#		var drop_size = randi() % (max_drop - min_drop + 1) + min_drop
#		for i in range(drop_size):
#			var drop = berry.instance()
#			var pos = translation
#			pos.x += rand_range(-0.2, 0.3) 
#			pos.z += rand_range(-0.2, 0.3)
#			drop.drop(pos)
#			get_parent().add_child(drop)


func interact():
	print("Iteracting with Berrybush")
	pass