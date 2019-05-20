extends "res://Scripts/Prop.gd"

var min_drop = 1
var max_drop = 3

# packed scene with log
var wooden_log = preload("res://Scenes/Items/Log.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func destroy():
	randomize()
	var drop_size = randi() % (max_drop - min_drop + 1) + min_drop
	for i in range(drop_size):
		var item = wooden_log.instance()
		var pos = translation
		item.drop(pos, get_parent())
	get_parent().remove_child(self)