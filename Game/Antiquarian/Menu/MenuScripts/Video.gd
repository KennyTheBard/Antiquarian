extends Popup

var slider

func _ready():
	slider = get_node("video_slider")
	slider.value = 50
	pass
	
