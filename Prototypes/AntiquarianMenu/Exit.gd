extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var exit_dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	exit_dialog = get_node("exit_dialog")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_yes_pressed():
	#exit game
	get_tree().quit()
	pass # Replace with function body.


func _on_exit_no_pressed():
	exit_dialog.hide()
	pass # Replace with function body.
