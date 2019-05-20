extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var audio
var video
var control
var interface

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = get_node("audio")
	video = get_node("video")
	control = get_node("control")
	interface = get_node("interface")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_audio_button_pressed():
	audio.show()


func _on_video_button_pressed():
	video.show()


func _on_control_button_pressed():
	control.show()


func _on_interface_button_pressed():
	interface.show()



func _on_option_dialog_back_pressed():
	get_node("option_dialog").hide()



func _on_audio_back_pressed():
	get_node("audio").hide()



func _on_control_back_pressed():
	get_node("control").hide()



func _on_interface_back_pressed():
	get_node("interface").hide()	



func _on_video_back_pressed():
	get_node("video").hide()	

