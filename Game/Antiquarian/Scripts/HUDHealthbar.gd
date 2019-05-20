extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health

var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	health = get_node("HealthProgressBar")
	tween = get_node("Tween")	
	tween.interpolate_method(health.get("custom_styles/fg"), "set_bg_color", Color("00ff00"), Color("ff0000"), 125 , Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	health.set_value(get_parent().get_parent().health)	

	pass

func _on_Tween_tween_step( object, key, value ):
    health.update()