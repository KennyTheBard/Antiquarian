extends Area2D

var dragged = false

func _process(delta):
	if dragged:
		self.position = get_viewport().get_mouse_position()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		dragged = true
		
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and !event.pressed:
		dragged = false
		
	pass
