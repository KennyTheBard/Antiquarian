extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum state {IDLE, WALK, ATTACK}
var curr_state = state.IDLE
var attacking = false
var right_oriented = true


func _ready():
	pass


func flip_sprites():
	$attack.flip_h = !right_oriented
	$walk.flip_h = !right_oriented
	$idle.flip_h = !right_oriented


func state_action():
	match curr_state:
		ATTACK:
			$attack.visible = true
			$walk.visible = false
			$idle.visible = false
		WALK:
			$attack.visible = false
			$walk.visible = true
			$idle.visible = false
		IDLE:
			$attack.visible = false
			$walk.visible = false
			$idle.visible = true

	pass


func _process(delta):

	if !attacking:
		if Input.is_key_pressed(KEY_A):
			# move left
			position.x -= delta * 150
			curr_state = state.WALK
			right_oriented = false
			if !$walk/walkanim.is_playing():
				$walk/walkanim.play("skel walk")

		elif Input.is_key_pressed(KEY_D):
			# move right
			position.x += delta * 150
			curr_state = state.WALK
			right_oriented = true
			if !$walk/walkanim.is_playing():
				$walk/walkanim.play("skel walk")

		elif Input.is_key_pressed(KEY_SPACE):
			# attack
			attacking = true
			curr_state = state.ATTACK
			$attack/attackanim.play("skel attack")
		else:
			curr_state = state.IDLE
			if !$idle/idleanim.is_playing():
				$idle/idleanim.play("skel idle")

	else:
		if !$attack/attackanim.is_playing():
			attacking = false
	
	state_action()
	
	flip_sprites()
	
	pass