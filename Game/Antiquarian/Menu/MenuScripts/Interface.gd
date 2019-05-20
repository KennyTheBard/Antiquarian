extends Popup

var min_button_size
var min_title_size

var slider_value
var slider

func _ready():
	slider = get_node("interface_slider")
	slider.value = 50
	slider_value = 50
	
	min_button_size = 30
	min_title_size = 50
	pass 
	
func _process(delta):
	if (slider_value != slider.value):
		slider_value = slider.value
#		print(slider_value) #debugging
		set_text(slider_value)
	pass
	
func set_text(var size):
	var button_size = min_button_size + size/2
	var title_size = min_title_size + size/2
		
	var menu_dialog = get_parent().get_parent().get_node("menu_dialog")
	
	#BUTTONS
	#	change size
	menu_dialog.get_node("continue_button").get("custom_fonts/font").set_size(button_size)

	#TITLES
	#	change size
	menu_dialog.get_node("title").get("custom_fonts/font").set_size(title_size)
	pass
