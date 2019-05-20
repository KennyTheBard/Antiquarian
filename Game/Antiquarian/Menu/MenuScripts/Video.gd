extends Popup

var slider
var slider_value
var max_color_factor = 0.35

func _ready():
	slider = get_node("video_slider")
	slider.value = 50
	slider_value = 0


func _process(delta):
	if (slider_value != slider.value):
		slider_value = slider.value
		if slider_value > 50:
			var alpha = max_color_factor * (slider_value - 50) / 100
			get_node("../../WhiteScreen").set("modulate",Color(1,1,1,alpha))
			
		elif slider_value < 50:
			var alpha = max_color_factor * (50 - slider_value) / 100
			get_node("../../WhiteScreen").set("modulate",Color(0,0,0,alpha))
			
		else:
			get_node("../../WhiteScreen").set("modulate",Color(1,1,1,0))