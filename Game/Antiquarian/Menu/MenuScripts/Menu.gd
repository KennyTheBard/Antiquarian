extends Node2D
onready var exit_dialog 	= get_node("Exit/exit_dialog")
onready var options_dialog 	= get_node("Options/option_dialog")
onready var menu_dialog 	= get_node("menu_dialog")
onready var bg 				= get_node("wallpaper")

func _ready():
	get_node("menu_dialog/title").get("custom_fonts/font").set_size(75)
	
	menu_dialog.show()
	bg.show()
	exit_dialog.hide()
	options_dialog.hide()


func _on_exit_button_pressed():
	menu_dialog.hide()
	exit_dialog.show()


func _on_options_button_pressed():
	menu_dialog.hide()
	options_dialog.show()


func _on_new_game_button_pressed():
	new_game_option()


func new_game_option():
	randomize()
	var world_seed = randi()
	save_data(world_seed)
	start_game(world_seed)


func _on_continue_button_pressed():
	continue_option()


func continue_option():
	var world_seed = load_data()
	if world_seed == null:
		new_game_option()
	start_game(world_seed)


func start_game(world_seed):
	var game_world = preload("res://Scenes/GameWorld.tscn").instance()
	game_world.create_world(world_seed)
	menu_dialog.hide()
	bg.hide()
	get_node("/root").add_child(game_world)


func save_data(world_seed):
	var file = File.new()
	file.open("user://save_game.dat", File.WRITE)
	file.store_string(str(world_seed))
	file.close()


func load_data():
	var file = File.new()
	if not file.file_exists("user://save_game.dat"):
		return null
	file.open("user://save_game.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	return int(content)