extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _process(delta):
	var speed = 10
	
	if Input.is_key_pressed(KEY_W):
		translation.x += speed * delta * -sin(rotation.y)
		translation.z += speed * delta * cos(rotation.y)
	elif Input.is_key_pressed(KEY_S):
		translation.x += speed * delta * -sin(rotation.y)
		translation.z += speed * delta * cos(rotation.y)
	elif Input.is_key_pressed(KEY_D):
		translation.x += speed * delta * cos(rotation.y)
		translation.z += speed * delta * sin(rotation.y)
	elif Input.is_key_pressed(KEY_A):
		translation.x += speed * delta * cos(rotation.y)
		translation.z += speed * delta * sin(rotation.y)
	elif Input.is_key_pressed(KEY_Q):
		rotation.y += speed * delta
	elif Input.is_key_pressed(KEY_E):
		rotation.y -= speed * delta
	
	pass
