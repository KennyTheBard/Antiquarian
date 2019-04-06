extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var option_dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	option_dialog = get_node("option_dialog")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_option_yes_pressed():
	option_dialog.hide()
	pass # Replace with function body.

