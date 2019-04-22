extends Control

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent()
	pass # Replace with function body.
func initialize():
	items.append(get_node("Item0"))
	items.append(get_node("Item1"))
	items.append(get_node("Item2"))
	items.append(get_node("Item3"))
	items.append(get_node("Item4"))

func set_value():
	value.append(0)
	value.append(4)
	value.append(2)
	value.append(5)
	value.append(18)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CompassBack.rect_rotation = player.rot * 180 / PI
	pass
