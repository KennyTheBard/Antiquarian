extends Area

# class member variables go here, for example:
# var a = 2
var RAY_LENGTH = 10000

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_obj_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = $Camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + $Camera.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
	
func _physics_process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var ret = get_obj_under_mouse()
		if ret.size() != 0:
			if ret.collider == self:
				print ("found!")
			
	pass
