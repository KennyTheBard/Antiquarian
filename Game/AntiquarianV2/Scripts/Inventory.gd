extends Spatial

# inventory implemented as a list that holds item type (or null in case
# of a empty slot) and a list of lists for item types instances
var slots = []
var stacks = []

# the size of the lists
var inventory_size = 6

# represents the current position in inventory
# always use it as <current_pos % inventory_size>
var current_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(inventory_size):
		slots.push_back(null)
		stacks.push_back([])
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Adds an item to the first non-full stack, or else first empty slot.
# 	@return: the given item if no slot available, else null
func add_item(item):
	# search for same-type non-full stacks
	for i in range(inventory_size):
		if slots[i] != null:
			if slots[i] == item.get_name():
				if item.stack_size > len(stacks[i]):
					stacks[i].push_back(item)
					return null
	
	# search for empty slots
	for i in range(inventory_size):
		if slots[i] == null:
			slots[i] = item.get_name()
			stacks[i].push_back(item)
			return null
	
	# no available slot
	return item


# Swap the given list of items with the stack at
# current position in the inventory, droping the former
# or null, if the slot was empty already
func swap(item, num):
	var aux_item = slots[current_pos % inventory_size]
	var aux_num = len(stacks[current_pos % inventory_size])
	slots[current_pos % inventory_size] = item
	stacks[current_pos % inventory_size] = num
	
	if aux_num > 0:
		return [aux_item, aux_num]
	else:
		return null

# Get one item from the slot at the current position
# and returns it or return null if the slot is empty
func take_item():
	if len(stacks[current_pos % inventory_size]) > 0:
		# recovering the current item
		var aux_item = stacks[current_pos % inventory_size].pop_front()
		
		# free up the slot if the stack is empty
		if len(stacks[current_pos % inventory_size]) == 0:
			slots[current_pos % inventory_size] = null
		
		# return the item
		return aux_item
	else:
		return null