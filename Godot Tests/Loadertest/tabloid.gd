extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize()
	var path = "res://" + str(randi() % 9 + 1) + ".jpg"

	var img = Image.new()
	img.load(path)
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	$image.texture = tex
	print($image.texture)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
