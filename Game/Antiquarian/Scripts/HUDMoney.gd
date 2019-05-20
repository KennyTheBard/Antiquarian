extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var money
# Called when the node enters the scene tree for the first time.
func _ready():
	money = get_node("DisplayMoney").set_text("015")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
