extends Control

var inventory = null
var stacks_size = []

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = get_parent().get_parent().get_inventory()
	stacks_size.append(get_node("Stacks/Stack1"))
	stacks_size.append(get_node("Stacks/Stack2"))
	stacks_size.append(get_node("Stacks/Stack3"))
	stacks_size.append(get_node("Stacks/Stack4"))
	stacks_size.append(get_node("Stacks/Stack5"))


# Update the items displayed in the inventory
func _process(delta):
	if inventory:
		for i in range(len(inventory.slots)):
			if inventory.slots[i]:
				var animSprite = inventory.stacks[i][0].get_node("Sprite")
				$Slots.get_child(i).texture = animSprite.frames.get_frame("default", animSprite.frame)
			else:
				$Slots.get_child(i).texture = ImageTexture.new()
			if len(inventory.stacks[i]) <= 1:
				stacks_size[i].set_text(" ")
			else:
				stacks_size[i].set_text(str(len(inventory.stacks[i])))
