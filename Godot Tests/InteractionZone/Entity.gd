extends Area2D

var trigger = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func activate():
	trigger = true
	$Sprite.modulate = Color(1, 0, 0)
	pass
