extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var NumOfItems
# Called when the node enters the scene tree for the first time.
func _ready():
	NumOfItems = get_node("NumOfItems").set_text("02845")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
