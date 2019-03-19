extends CollisionShape

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
	var ray_to = ray_from + $Camera.project_ray_origin(mouse_pos) * RAY_LENGTH
	print(ray_from, " to ", ray_from)
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
	
func _physics_process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		print("click ", get_obj_under_mouse().size())
	pass
