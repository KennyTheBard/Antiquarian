extends Popup

var slider
var slider_value
var volume_radius = 24
var music_box

func _ready():
	slider = get_node("volume_slider")
	slider.value = 50
	slider_value = 0
	music_box = get_node("../../MusicBox")


func _process(delta):
	if (slider_value != slider.value):
		slider_value = slider.value
		var volume = volume_radius * (slider_value - 50) / 100
		music_box.volume_db = volume

