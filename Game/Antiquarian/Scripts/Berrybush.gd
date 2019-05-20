extends "res://Scripts/Prop.gd"

# regeneration parameters
var min_ripe_time = 120
var max_ripe_time = 180
var min_drop = 1
var max_drop = 3
var ripe_time = 0
var ripe = true

# packed scene with berry
var berry = preload("res://Scenes/Items/Consumable/Berry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.play("Full")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not ripe:
		ripe_time -= delta
		if ripe_time <= 0:
			ripe_time = 0
			ripe = true
			

func interact(agent):
	if ripe:
		randomize()
		ripe = false
		$Sprite.play("Empty")
		ripe_time = randi() % 120 + 180
		var drop_size = randi() % (max_drop - min_drop + 1) + min_drop
		for i in range(drop_size):
			var item = berry.instance()
			var pos = translation
			item.drop(pos, get_parent())