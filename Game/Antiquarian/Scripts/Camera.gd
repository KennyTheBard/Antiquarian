extends Camera

# movement speed
var speed = 5

# value which the player is already rotated
var rot = 0

# the value with which the rotation will be done
var rotate_factor = PI / 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_KP_8):
		translation.z += speed * delta * -cos(rot)
		translation.x += speed * delta * -sin(rot)
		
	if Input.is_key_pressed(KEY_KP_2):
		translation.z += speed * delta * cos(rot)
		translation.x += speed * delta * sin(rot)
		
	if Input.is_key_pressed(KEY_KP_4):
		translation.z += speed * delta * sin(rot)
		translation.x += speed * delta * -cos(rot)
		
	if Input.is_key_pressed(KEY_KP_6):
		translation.z += speed * delta * -sin(rot)
		translation.x += speed * delta * cos(rot)
		
	if Input.is_key_pressed(KEY_KP_5):
		translation.y += speed * delta
		
	if Input.is_key_pressed(KEY_KP_0):
		translation.y -= speed * delta
		
	if Input.is_key_pressed(KEY_KP_1):
		rotate(Vector3(1, 0, 0), rotate_factor * delta)
		
	if Input.is_key_pressed(KEY_KP_3):
		rotate(Vector3(1, 0, 0), -rotate_factor * delta)
		
	if Input.is_key_pressed(KEY_KP_7):
		rotate(Vector3(0, 1, 0), rotate_factor * delta)
		rot += rotate_factor * delta
	
	if Input.is_key_pressed(KEY_KP_9):
		rotate(Vector3(0, 1, 0), -rotate_factor * delta)
		rot += -rotate_factor * delta
		
	pass
