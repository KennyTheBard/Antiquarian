extends Node2D

var speed = 250
var pick = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
		
	if pick > 0:
		pick -= delta
	else:
		pick = 0
		$Entity/Sprite.modulate = Color(1, 1, 1)
	
	if Input.is_key_pressed(KEY_W):
		position.y -= speed * delta
		
	if Input.is_key_pressed(KEY_S):
		position.y += speed * delta
		
	if Input.is_key_pressed(KEY_A):
		position.x -= speed * delta
		
	if Input.is_key_pressed(KEY_D):
		position.x += speed * delta
		
	pass

func _physics_process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		# bodies can also be used, but the other
		# entities must be modeled with bodies
		var areas = $InteractZone.get_overlapping_areas()
		if not areas:
			return

		for area in areas:
			if area == $Entity:
				continue
			if area.trigger:
				continue
			area.activate()
			pick = 0.1
			$Entity/Sprite.modulate = Color(1, 1, 0)
			break

	pass
