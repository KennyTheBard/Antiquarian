extends Sprite3D
var position_x = [-3.26, -2.59, -1.92, -1.24, -0.57, 0.1, 0.76, 1.45, 2.12]
var position_y = [-0.1, 0.1]
var position_z = 0.01

var ITEM = 0
var TYPE = 1
var QUANTITY = 2
var POSITION = 3

var NUM = 1
var SIZE  = 9
var INDEX = 0
var items = [] 
	#item is a tuple and has the following structure :
	#	[0] ~ sprite  ~ item, 
	#	[1] ~ string  ~ type, 
	#	[2] ~ integer ~ number of items, 
	#	[3] ~ Vector3 ~ actual position
var item_position = []
var num_position  = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize()	
	pass

func add(var node):
	var index = -1
	for i in range(SIZE):
		if items[i] != null && items[i][TYPE] == node[TYPE]:
			index = i
	if index >= 0:
		_add_item([node[ITEM], node[TYPE],node[QUANTITY]], index)
	else:
		_add_item([node[ITEM], node[TYPE],node[QUANTITY]], INDEX)
		if INDEX < SIZE:
			INDEX += 1

func _add_item(var node, var index):
	
	#if there is a slot with that index and the slotis empty
	if(index in range(SIZE) && items[index] == null):
		
		#gen an instance
		items[index] = [node[ITEM], node[TYPE], node[QUANTITY]]
		
		#place the item in his slot and scale it 
		items[index][ITEM].translate(item_position[index])
		
		#add this item as a child of the inventory node
		add_child(items[index][ITEM])
			
	#if there is a slot with that index and the slot contains elements of the same type	
	elif(index in range(SIZE) && items[index][TYPE] == node[TYPE]):
		#place the item => the num of items in that slot increases
		items[index][QUANTITY] += node[QUANTITY]
		
	#if there is a slot with that index and the slot doesn't contains elements of the same type	
	elif(index in range(SIZE)):
		#drop the item 
		_drop_item(items[index], item_position[index])
		
		#gen an instance
		items[index] = [node[ITEM], node[TYPE], 1]
		
		#place the item in his slot and scale it 
		items[index][ITEM].translate(item_position[index])
		
		#add this item as a child of the inventory node
		add_child(items[index][ITEM])
		
func _drop_item(var node, var position):
	#place the item at his position
	remove_child(node[ITEM])
	return node
	
func get_item(var index):
	#place the item at his position
	var object = null
	
	if index in range(SIZE) && items[index] != null:
		object = _drop_item(items[index], item_position[index])
		items[index] = null
		return object
		
	return null

func _initialize():
	for i in range(SIZE):
		#make null the inventory
		items.append(null)

		#set the position for every slot
		item_position.append(Vector3(position_x[i], position_y[ITEM], position_z))
		
		#set the position for every text (displays the number of items in that slot)
		num_position.append(Vector3(position_x[i], position_y[NUM], position_z))

