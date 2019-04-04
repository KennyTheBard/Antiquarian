extends Camera2D

var speed = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_W):
		position.y -= speed * delta
	if Input.is_key_pressed(KEY_S):
		position.y += speed * delta
	if Input.is_key_pressed(KEY_D):
		position.x += speed * delta
	if Input.is_key_pressed(KEY_A):
		position.x -= speed * delta
		
	pass
