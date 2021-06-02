extends MarginContainer

class_name SubMenuButton
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var function:SubMenuButtonFunction
export var button_label_path:NodePath
onready var button_label:Label = get_node(button_label_path)

func setup(display, inst, funcname):
	button_label.text = display
	function = SubMenuButtonFunction.new(display, inst, funcname)
	return


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func pressed():
	
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	function.function.call_func()
	Game.submenu_close()
	pass # Replace with function body.
