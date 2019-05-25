extends "res://Scripts/Entity.gd"

var speed = 450
var damage = 21
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = (player.translation - self.translation).normalized()
	var movement = dir * speed * delta
	move_and_slide(movement)

func _physics_process(delta):
	var bodies = $InteractionZone.get_overlapping_bodies()
	if not bodies:
		return
	
	for body in bodies:
		if body == player:
			player.health -= damage * delta
		
		# this means it is a prop
		if body.has_method("destroy"):
			body.destroy()
			break

