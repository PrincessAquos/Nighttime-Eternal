extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _pressed():
	var but_parent:SubMenuButton = get_parent()
	but_parent.pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
