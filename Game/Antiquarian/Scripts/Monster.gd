extends "res://Scripts/Entity.gd"

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	target = null

func set_target(object):
	target = object

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null:
		pass

