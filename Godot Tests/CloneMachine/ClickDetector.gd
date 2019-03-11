extends Area2D


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()
	

func on_click():
	for i in range(4):
		var inst = self.duplicate()
		var pos = Vector2(self.position.x, self.position.y)
		
		if i % 2 == 0:
			pos.x -= 100
		else:
			pos.x += 100
			
		if i < 2:
			pos.y -= 100
		else:
			pos.y += 100
			
		get_node("..").add_child(inst)
		inst.position = pos
#		get_node("..").remove_child(self)
		queue_free()