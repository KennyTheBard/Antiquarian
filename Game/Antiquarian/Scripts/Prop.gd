extends StaticBody

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.rotate(Vector3(1, 0, 0), PI / 180 * -25)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func destroy():
	queue_free()


func interact(agent):
	print("Iteracting with Prop")
	pass
