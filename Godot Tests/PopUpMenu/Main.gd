extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var TradePopUpMenu
var NPCPopupMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	TradePopUpMenu = get_node("TradePopupMenu")
	NPCPopupMenu = get_node("NPCPopupMenu")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	TradePopUpMenu.hide()
	NPCPopupMenu.show()
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	NPCPopupMenu.hide()
	pass # Replace with function body.


func _on_Button_pressed():
	TradePopUpMenu.show()
	NPCPopupMenu.hide()
	pass # Replace with function body.
