extends Popup

var slider
var slider_value = 0

func _ready():
	slider = get_node("video_slider")
	slider.value = 0
	slider_value = 50


func _process(delta):
	if (slider_value != slider.value):
		slider_value = slider.value
		var alpha = 0.5 * slider_value / 100
		get_node("../../WhiteScreen").set("modulate",Color(0,0,0,alpha))
