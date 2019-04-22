extends "res://Scripts/Entity.gd"

# movement speed
var speed = 5

# value which the player is already rotated
var rot = 0

# check if the button is already pressed
var pressed = false

# the value with which the rotation will be done
var rotate_factor = PI / 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up"):
		translation.z += speed * delta * -cos(rot)
		translation.x += speed * delta * -sin(rot)
		
	if Input.is_action_pressed("move_down"):
		translation.z += speed * delta * cos(rot)
		translation.x += speed * delta * sin(rot)
		
	if Input.is_action_pressed("move_left"):
		translation.z += speed * delta * sin(rot)
		translation.x += speed * delta * -cos(rot)
		
	if Input.is_action_pressed("move_right"):
		translation.z += speed * delta * -sin(rot)
		translation.x += speed * delta * cos(rot)
		
	if Input.is_action_just_pressed("rotate_left"):
		rotate(Vector3(0, 1, 0), rotate_factor)
		rot += rotate_factor
	
	if Input.is_action_just_pressed("rotate_right"):
		rotate(Vector3(0, 1, 0), -rotate_factor)
		rot += -rotate_factor
	
	pass


func distance_comparition(a, b):
	return translation.distance_squared_to(a.translation) < \
		translation.distance_squared_to(b.translation)


func _physics_process(delta):
	if !Input.is_key_pressed(KEY_SPACE):
		pressed = false
		
	if !pressed && Input.is_key_pressed(KEY_SPACE):
		pressed = true
		
		# bodies can also be used, but the other
		# entities must be modeled with bodies
		var objs = $InteractionZone.get_overlapping_areas()
		var bodies = $InteractionZone.get_overlapping_bodies()
		for body in bodies:
			objs.append(body)
		
		if not objs:
			return
		
		# sort the areas by distance to activate the
		# closest one first
		objs.sort_custom(self, "distance_comparition")
		
		for obj in objs:
			if obj == $Body:
				continue
			
			obj.get_parent().interact()
			
			break
	
	pass