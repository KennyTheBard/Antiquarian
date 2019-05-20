extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func rotate_children(value):
	for node in get_children():
		node.get_node("Sprite").rotate(Vector3(0, 1, 0), value)
