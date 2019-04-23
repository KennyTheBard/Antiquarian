extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var equipment
var items_size = 9
var actual_size = 0
var width = 100 #TODO
var margins = 5
var items = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#set item slots to empty
	for i in range (0, items_size):
		items[i] = null
	
	#set equipment slot to empty
	equipment = null
	pass

func add_item(var node, var position):
	#check if the position is within our range
	if(position < items_size):
		#drop the old item if the location is not empty
#		if(items[position] != null):
#			drop_item(items[position])
		
		#place the item
		items[position] = node
		
		return true
	
	else:
		return false
	pass
	
func add_equipment(var node):
	#if there is another equipment it will be dropped
	if(equipment != null):
		drop_equipment(equipment)
	
	#place the equipment
	equipment = node
	pass 

func drop_equipment(var node):
	#TODO
	pass 

func place_item(var node):
	#TODO
	pass

func place_equipment(var position, var node):
	#TODO
	
	pass 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
