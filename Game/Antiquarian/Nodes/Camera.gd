extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translation.x = get_parent().get_node("Player").translation.x
	translation.z = get_parent().get_node("Player").translation.y
	print(get_parent().get_node("Player").translation)
	print(translation)
