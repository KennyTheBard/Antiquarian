extends Spatial

# dictionary of all active objects with their ID as key
var objects = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# add the object into the managed game world
func add(object):
	objects[object.id] = object
	add_child(object)
	pass


# delete the object from the managed game world
func delete(object):
	objects.erase(object.id)
	remove_child(object)
	pass