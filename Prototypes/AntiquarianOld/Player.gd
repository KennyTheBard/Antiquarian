extends Spatial

# movement speed
var speed = 250

# time to stay modulate as you press
var pick = 0

# check if the button is already pressed
var pressed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	# counter for coloring effect
	if pick > 0:
		pick -= delta
	else:
		pick = 0
	
	# movement controls
	if Input.is_key_pressed(KEY_W):
		translation.z -= speed * delta
		
	if Input.is_key_pressed(KEY_S):
		translation.z += speed * delta
		
	if Input.is_key_pressed(KEY_A):
		translation.x -= speed * delta
		
	if Input.is_key_pressed(KEY_D):
		translation.x += speed * delta
		
	pass


func distance_comparition(a, b):
	return translation.distance_squared_to(a.translation) < \
	translation.distance_squared_to(b.translation)


func _physics_process(delta):
	if !Input.is_key_pressed(KEY_SPACE):
		pressed = false
		
	if !pressed && Input.is_key_pressed(KEY_SPACE):
		pressed = true
		
		# button presssed effect
		pick = 0.1
		
		# bodies can also be used, but the other
		# entities must be modeled with bodies
		var objs = []
		for body in $InteractZone.get_overlapping_bodies():
			objs.append(body)
		objs.remove(objs.find($Body))
#		for area in $InteractZone.get_overlapping_areas():
#			objs.append(area)
		if not objs:
			return
		
		# sort the areas by distance to activate the
		# closest one first
		objs.sort_custom(self, "distance_comparition")

		objs[0].interact()



	pass
