extends Area

var stack_size = 1
var resource_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.rotate(Vector3(1, 0, 0), PI / 180 * -25)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func drop(pos, manager):
	randomize()
	translation = Vector3() + pos
	translation.x += rand_range(-1, 1) 
	translation.z += rand_range(-1, 1)
	manager.add_child(self)
	pass


func interact(agent):
	get_parent().remove_child(self)
	agent.get_inventory().add_item(self)
	pass