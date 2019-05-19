extends Node

var exit_dialog
var exit_yes
var exit_no
var exit_question

func _ready():
	exit_dialog = get_node("exit_dialog")
	exit_question = get_node("exit_dialog/exit_question")	
	exit_yes = get_node("exit_dialog/exit_yes_button")
	exit_no = get_node("exit_dialog/exit_no_button")
	pass
	
func _on_exit_no_button_pressed():
	exit_dialog.hide()
	get_parent().menu_dialog.show()
	pass 

func _on_exit_yes_button_pressed():
	get_tree().quit()
	pass 