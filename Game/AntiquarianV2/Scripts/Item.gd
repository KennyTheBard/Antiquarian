extends "res://Scripts/GameObject.gd"

var stack_size = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func drop(pos):
	translation = pos
	pass


func interact(agent):
	print("Iteracting with Item")
	pass