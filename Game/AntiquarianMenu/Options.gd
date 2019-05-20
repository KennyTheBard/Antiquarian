extends Node

var audio
var video
var control
var interface
var options

func _ready():
	audio = get_node("audio")
	video = get_node("video")
	control = get_node("control")
	interface = get_node("interface")
	options = get_node("option_dialog")
	
func _on_audio_button_pressed():
	audio.show()
	options.hide()

func _on_video_button_pressed():
	video.show()
	options.hide()

func _on_control_button_pressed():
	control.show()
	options.hide()

func _on_interface_button_pressed():
	interface.show()
	options.hide()

func _on_option_dialog_back_pressed():
	options.hide()
	get_parent().menu_dialog.show()

func _on_audio_back_pressed():
	audio.hide()
	options.show()
	
func _on_control_back_pressed():
	control.hide()
	options.show()

func _on_interface_back_pressed():
	interface.hide()
	options.show()

func _on_video_back_pressed():
	video.hide()
	options.show()