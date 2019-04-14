extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func init():
	# initiate the Sprite child node
	var sp = Sprite3D.new()
	sp.name = "Sprite"
	add_child(sp)
	
	pass
	
func interact():
	pass
