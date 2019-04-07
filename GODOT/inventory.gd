extends Sprite3D
var position_x = [-3.26, -2.59, -1.92, -1.24, -0.57, 0.1, 0.76, 1.45, 2.12]
var position_y = [-0.1, 0.1]
var position_z = 0.01
var ITEM = 0
var NUM = 1

const item  = [preload("res://Item.tscn"),  "item"]
const berry = [preload("res://berry.tscn"), "berry"]
const axe   = [preload("res://axe.tscn"),   "axe"]
const stone = [preload("res://stone.tscn"), "stone"]
var TYPE = 1
var QUANTITY = 2
var POSITION = 3

var SIZE  = 9
var INDEX = 0
var items         = [] 
	#item is a tuple and has the following structure :
	#	[0] ~ sprite  ~ item, 
	#	[1] ~ string  ~ type, 
	#	[2] ~ integer ~ number of items, 
	#	[3] ~ Vector3 ~ actual position
var item_position = []
var num_position  = []
var scale_factor  = Vector3(0.9, 0.9, 1)
var droped_items  = []
var droped_position = Vector3(0 , 1.3, 0.01)
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
		_add_item([_get_object(node[TYPE]), node[TYPE],node[QUANTITY]], index)
	else:
		_add_item([_get_object(node[TYPE]), node[TYPE],node[QUANTITY]], INDEX)
		if INDEX < SIZE:
			INDEX += 1

#return a new node depending on tipe
func _get_object(var type):
	if type == berry[TYPE]:
		return berry[ITEM]
	
	if type == stone[TYPE]:
		return stone[ITEM]
	
	if type == axe[TYPE]:
		return axe[ITEM]
	
	return item[ITEM]

func _add_item(var node, var index):
	
	#if there is a slot with that index and the slotis empty
	if(index in range(SIZE) && items[index] == null):
		
		#gen an instance
		items[index] = [node[ITEM].instance(), node[TYPE], node[QUANTITY], item_position[index]]
		
		#place the item in his slot and scale it 
		items[index][ITEM].translate(items[index][POSITION])
		items[index][ITEM].set_scale(scale_factor)
		
		#add this item as a child of the inventory node
		add_child(items[index][ITEM])
			
	#if there is a slot with that index and the slot contains elements of the same type	
	elif(index in range(SIZE) && items[index][TYPE] == node[TYPE]):
		#place the item => the num of items in that slot increases
		items[index][QUANTITY] += node[QUANTITY]
		
		#only for tests
		print ("number of items in slot ",index ," : ",items[index][QUANTITY])
	
	#if there is a slot with that index and the slot doesn't contains elements of the same type	
	elif(index in range(SIZE)):
		#drop the item 
		_drop_item(items[index])
		
		#gen an instance
		items[index] = [node[ITEM].instance(), node[TYPE], 1, item_position[index]]
		
		#place the item in his slot and scale it 
		items[index][ITEM].translate(items[index][POSITION])
		items[index][ITEM].set_scale(scale_factor)
		
		#add this item as a child of the inventory node
		add_child(items[index][ITEM])
		
func _drop_item(var node):
	#change it's position
	node[POSITION] = droped_position
	
	#place the item at that position
	node[ITEM].translate(droped_position)
	
	#add the item into the dropped list
	droped_items.append([node])

func _initialize():
	for i in range(SIZE):
		#make null the inventory
		items.append(null)

		#set the position for every slot
		item_position.append(Vector3(position_x[i], position_y[ITEM], position_z))
		
		#set the position for every text (displays the number of items in that slot)
		num_position.append(Vector3(position_x[i], position_y[NUM], position_z))

