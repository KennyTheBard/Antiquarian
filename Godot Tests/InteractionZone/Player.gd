extends Node2D

# movement speed
var speed = 250

# time to stay modulate as you press
var pick = 0

# check if the button is already pressed
var pressed = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _process(delta):
		
	# counter for coloring effect
	if pick > 0:
		pick -= delta
	else:
		pick = 0
		$Entity/Sprite.modulate = Color(1, 1, 1)
	
	# movement controls
	if Input.is_key_pressed(KEY_W):
		position.y -= speed * delta
		
	if Input.is_key_pressed(KEY_S):
		position.y += speed * delta
		
	if Input.is_key_pressed(KEY_A):
		position.x -= speed * delta
		
	if Input.is_key_pressed(KEY_D):
		position.x += speed * delta
		
	pass



func distance_comparition(a, b):
	return position.distance_squared_to(a.position) < \
	position.distance_squared_to(b.position)



func _physics_process(delta):
	if !Input.is_key_pressed(KEY_SPACE):
		pressed = false
		
	if !pressed && Input.is_key_pressed(KEY_SPACE):
		pressed = true
		
		# button presssed effect
		pick = 0.1
		$Entity/Sprite.modulate = Color(1, 1, 0)
		
		# bodies can also be used, but the other
		# entities must be modeled with bodies
		var areas = $InteractZone.get_overlapping_areas()
		if not areas:
			return
		
		# sort the areas by distance to activate the
		# closest one first
		areas.sort_custom(self, "distance_comparition")
		
		for area in areas:
			if area == $Entity:
				continue
			if area.trigger:
				continue
			area.activate()
			break

	pass
