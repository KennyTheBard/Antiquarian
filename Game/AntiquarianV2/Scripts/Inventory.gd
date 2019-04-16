extends Spatial

# inventory implemented as a list that holds item type (or null in case
# of a empty slot) and a list for current stack size
var slots = []
var stack = []

# the size of the lists
var inventory_max_size = 6

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(inventory_max_size):
		slots.append(null)
		stack.appen(0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Adds an item to the first non-full stack, or else first empty slot.
# 	@return: the given item if no slot available, else null
func add_item(item):
	# search for same-type non-full stacks
	for i in len(slots):
		if slots[i] != null:
			if slots[i].get_name() == item.get_name():
				if item.stack_size > stack[i]:
					stack[i] += 1
					return null
	
	# search for empty slots
	for i in len(slots):
		if slots[i] == null:
			slots[i] = item
			stack[i] = 1
			return null
	
	# no available slot
	return item


# get 
func take_item(slot_num, number):
	pass