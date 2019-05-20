extends Node2D
var exit_dialog
var options_dialog
var menu_dialog

func _ready():
	get_node("menu_dialog/title").get("custom_fonts/font").set_size(75)

	menu_dialog = get_node("menu_dialog")
	menu_dialog.show()
		
	exit_dialog = get_node("Exit/exit_dialog")
	exit_dialog.hide()
	
	options_dialog = get_node("Options/option_dialog")
	options_dialog.hide()
	pass
	
func _on_exit_button_pressed():
	exit_dialog.show()
	menu_dialog.hide()
	pass 

func _on_options_button_pressed():
	options_dialog.show()
	menu_dialog.hide()
	pass 

func _on_continue_button_pressed():
	pass 

func _on_new_game_button_pressed():
	pass 