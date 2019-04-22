extends Control

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CompassBack.rect_rotation = player.rot * 180 / PI
	pass
