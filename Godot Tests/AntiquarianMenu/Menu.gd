extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var exit_dialog
# Called when the node enters the scene tree for the first time.
func _ready():
	exit_dialog = get_node("Exit/exit_dialog")
	exit_dialog.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_pressed():
	exit_dialog.show()
	pass # Replace with function body.
