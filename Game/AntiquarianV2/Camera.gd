extends Camera

# movement speed
var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
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