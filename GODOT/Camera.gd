extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ITEM = 0
var TYPE = 1
var QUANTITY = 2
var POSITION = 3

const item  = [preload("res://Item.tscn"),  "item"]
const berry = [preload("res://berry.tscn"), "berry"]
const axe   = [preload("res://axe.tscn"),   "axe"]
const stone = [preload("res://stone.tscn"), "stone"]

onready var inventory = get_node("inventory")

var scale_factor  = Vector3(0.9, 0.9, 1)

var object = []
# Called when the node enters the scene tree for the first time.
func _ready():
		#gen an instance
		var obj = [item[ITEM].instance(), item[TYPE], 1, Vector3(0,1,-3.7)]
		obj[ITEM].translate(obj[POSITION])
		obj[ITEM].set_scale(scale_factor)
		add_child(obj[ITEM])
		object.append(obj)
		
		obj = [berry[ITEM].instance(), berry[TYPE], 1, Vector3(1,1,-3.7)]
		obj[ITEM].translate(obj[POSITION])
		obj[ITEM].set_scale(scale_factor)
		add_child(obj[ITEM])
		object.append(obj)
		
		obj = [axe[ITEM].instance(), axe[TYPE], 1, Vector3(0,2,-3.7)]
		obj[ITEM].translate(obj[POSITION])
		obj[ITEM].set_scale(scale_factor)
		add_child(obj[ITEM])
		object.append(obj)
		
		
func add_to_inventory(var node):
	if(node != []):
		remove_child(node[ITEM])
		inventory.add(node)
	return []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_key_pressed(KEY_K):
			add_to_inventory(object.back())
			