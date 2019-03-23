extends Node2D

var id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# interact with the game object depending on given flags
func interact(flags):
	# InteractionNode is responsible to have the interaction
	# logic script attached to itself
	if $InteractionNode:
		$InteractionNode.interact(flags)
	pass