extends "res://Entity.gd"

# movement speed
var speed = 2

# value which the player is already rotated
var rot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func init():
	# call parent init
	.init()
	
	$Sprite.texture = load("res://JimmyRascal_idle.png")
	$Sprite.translation.y += 0.2
	$Sprite.scale = Vector3(0.2, 0.2, 0.2)
	
	$Sprite.offset.y += 20
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_W):
		translation.z += speed * delta * -cos(rot)
		translation.x += speed * delta * -sin(rot)
	if Input.is_key_pressed(KEY_S):
		translation.z += speed * delta * cos(rot)
		translation.x += speed * delta * sin(rot)
	if Input.is_key_pressed(KEY_A):
		translation.z += speed * delta * sin(rot)
		translation.x += speed * delta * -cos(rot)
	if Input.is_key_pressed(KEY_D):
		translation.z += speed * delta * -sin(rot)
		translation.x += speed * delta * cos(rot)
	if Input.is_action_just_pressed("ui_rotate_left"):
		rotate(Vector3(0, 1, 0), PI / 4)
		rot += PI / 4
	if Input.is_action_just_pressed("ui_rotate_right"):
		rotate(Vector3(0, 1, 0), -PI / 4)
		rot -= PI / 4
		
	pass