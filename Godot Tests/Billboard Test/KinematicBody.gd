extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var motion = Vector3()
	var speed = 5
	
#	if Input.is_key_pressed(KEY_W):
#		motion.z += speed * delta
#	elif Input.is_key_pressed(KEY_S):
#		motion.z -= speed * delta
#	elif Input.is_key_pressed(KEY_D):
#		motion.x += speed * delta
#	elif Input.is_key_pressed(KEY_A):
#		motion.x -= speed * delta
#	elif Input.is_key_pressed(KEY_Q):
#		motion.y += speed * delta
#	elif Input.is_key_pressed(KEY_E):
#		motion.y -= speed * delta

	move_and_collide(motion)

	pass
