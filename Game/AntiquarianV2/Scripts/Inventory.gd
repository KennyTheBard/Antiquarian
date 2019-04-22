extends Spatial

# inventory implemented as a list that holds item type (or null in case
# of a empty slot) and a list of lists for item types instances
var slots = []
var stacks = []

# the size of the lists
var inventory_size = 5

# represents the current position in inventory
# always use it as <current_pos % inventory_size>
var current_slot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(inventory_size):
		slots.push_back(null)
		stacks.push_back([])
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change_current_slot_left"):
		current_slot = (current_slot - 1) % inventory_size
	
	if Input.is_action_just_pressed("change_current_slot_right"):
		current_slot = (current_slot + 1) % inventory_size
	
	if Input.is_action_just_pressed("drop_stack"):
		var stack = drop_all()
		for item in stack:
			item.drop(get_parent().translation)
	
#	if Input.is_action_just_pressed("equip"):
	
	pass


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


# Get one item from the slot at the current position
# and returns it or return null if the slot is empty
func take_item():
	if len(stacks[current_slot % inventory_size]) > 0:
		# recovering the current item
		var aux_item = stacks[current_slot % inventory_size].pop_front()
		
		# free up the slot if the stack is empty
		if len(stacks[current_slot % inventory_size]) == 0:
			slots[current_slot % inventory_size] = null
		
		# return the item
		return aux_item
	else:
		return null


# Drop all items from the slot at the current position
# and returns them as a list (empty list if no object
# in the said slot) 
func drop_all():
	# recovering the items
	var aux_items = []
	while not stacks[current_slot % inventory_size].empty():
		aux_items.append(stacks[current_slot % inventory_size].pop_front())
	
	# free up the slot
	slots[current_slot % inventory_size] = null
	
	# return the item
	return aux_items