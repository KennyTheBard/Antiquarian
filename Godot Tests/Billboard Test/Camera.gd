extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var v = 0
	pass

func _process(delta):
	self.v += delta * 1
	var motion = Vector3()
	motion.y = sin(self.v)
	
	get_node(".").set_pos(get_pos() + motion)
	
	pass
