extends Camera

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
var position = Vector3(1,1,-3.7)
var index = 5

var object
var node

# Called when the node enters the scene tree for the first time.
func _ready():
		#gen an instance
		object = [berry[ITEM].instance(), berry[TYPE], 1]
		object[ITEM].translate(position)
		add_child(object[ITEM])
		

func add_to_inventory(var node):
	if(node != [] && node != null):
		#remove from child nodes
		remove_child(node[ITEM])
		
		#move to it's initial position
		node[ITEM].translate(-position)
		
		#add to inventory
		inventory._add_item(node,5)
	
	#remove from this node
	return []

func get_from_inventory():
	#get the node from inventory
	if index == 5:
		object = inventory.get_item(index)
	
	#if the node is not null
	if(object != null && object != []):	
	
		#redo the last translation
		object[ITEM].translate(-object[ITEM].get_translation())
		
		#move somewhere visible
		object[ITEM].translate(position)
		
		#add it as a child
		add_child(object[ITEM])
		
		#index is null (to be used only once)
		return null
	
	#return index's value
	return 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_key_pressed(KEY_K):	
			object = add_to_inventory(object)
		
		if Input.is_key_pressed(KEY_M):
			index = get_from_inventory()
			