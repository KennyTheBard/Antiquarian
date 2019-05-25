extends "res://Scripts/Entity.gd"

# movement speed
var speed = 500

# value which the player is already rotated
var rot = 0

# value of rotation ther player needs to have
var trg_rot = 0

# the value with which the rotation will be modified after a press
var rotate_factor = PI / 4

# the value with which the rotation will be modified after a frame
var rotate_speed = rotate_factor / 15

# the rotation floating point calculation error
var error_threshold = 0.001

# stats and attributes
var max_health = 100
var health

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector3()
	
	if Input.is_action_pressed("move_up"):
		movement.z += speed * delta * -cos(rot)
		movement.x += speed * delta * -sin(rot)
		
	if Input.is_action_pressed("move_down"):
		movement.z += speed * delta * cos(rot)
		movement.x += speed * delta * sin(rot)
		
	if Input.is_action_pressed("move_left"):
		movement.z += speed * delta * sin(rot)
		movement.x += speed * delta * -cos(rot)
		
	if Input.is_action_pressed("move_right"):
		movement.z += speed * delta * -sin(rot)
		movement.x += speed * delta * cos(rot)
	
	move_and_slide(movement)
#	translation += movement
	
	if Input.is_action_just_pressed("rotate_left"):
		trg_rot += rotate_factor
	
	if Input.is_action_just_pressed("rotate_right"):
		trg_rot += -rotate_factor
	
	if abs(rot - trg_rot) > error_threshold:
		if rot < trg_rot:
			rotate(Vector3(0, 1, 0), rotate_speed)
			get_node("../ObjectManager").rotate_children(rotate_speed)
			get_node("../Monster").rotate(Vector3(0, 1, 0), rotate_speed)
			rot += rotate_speed
				
		elif rot > trg_rot:
			rotate(Vector3(0, 1, 0), -rotate_speed)
			get_node("../ObjectManager").rotate_children(-rotate_speed)
			get_node("../Monster").rotate(Vector3(0, 1, 0), -rotate_speed)
			rot -= rotate_speed
	
	pass


func distance_comparition(a, b):
	return translation.distance_squared_to(a.translation) < \
		translation.distance_squared_to(b.translation)


func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
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
			if obj == self:
				continue
			
			obj.interact(self)
			
			break
	pass


func get_inventory():
	return $Inventory