extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var items = []
var value = []
# Called when the node enters the scene tree for the first time.
func _ready():
	initialize()
	set_value()
	
#	NumOfItems = get_node("NumOfItems").set_text("02845")
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
	for i in range(0, items.size()):
		if value[i] <= 1:
			items[i].set_text(" ")
		else:
			items[i].set_text(str(value[i]))
	pass
