extends "res://Scripts/GameObject.gd"

var stack = 1
var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print_tree_pretty()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# drop the item to the given position in the game world
func drop(manager, pos):
	self.position = pos
	manager.add(self)
	pass