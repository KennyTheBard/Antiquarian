extends Control

var NumOfItems

var inventory = null

# Called when the node enters the scene tree for the first time.
func _ready():
	NumOfItems = get_node("NumOfItems").set_text("02845")
	inventory = get_parent().get_parent().get_inventory()


# Update the items displayed in the inventory
func _process(delta):
	if inventory:
		for i in range(len(inventory.slots)):
			if inventory.slots[i]:
				var animSprite = inventory.stacks[i][0].get_node("Sprite")
				$Slots.get_child(i).texture = animSprite.frames.get_frame("default", animSprite.frame)
			else:
				$Slots.get_child(i).texture = ImageTexture.new()

