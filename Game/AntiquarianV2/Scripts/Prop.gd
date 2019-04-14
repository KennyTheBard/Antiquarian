extends "res://Scripts/GameObject.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	init()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init():
	# call parent init
	.init()
	
	# initiate the physics component
	var body = StaticBody.new()
	body.name = "Body"
	var shape = CylinderShape.new()
	shape.resource_name = "Shape"
	shape.radius = 3
	shape.height = 1
	var shape_owner = body.create_shape_owner(body)
	body.shape_owner_add_shape(shape_owner, shape)
	add_child(body)
	
	pass
