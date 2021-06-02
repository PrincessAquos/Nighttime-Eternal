extends MarginContainer

class_name SubMenu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#export var button_container_path:NodePath
onready var button_container = get_node("MarginContainer/VBoxContainer")

export var button_scene:PackedScene

func setup(button_id_arr):
	for button_id in button_id_arr:
		var new_button = button_scene.instance()
		button_container.add_child(new_button)
		match button_id:
			"move":
				new_button.setup("Move", Game.cursor, "start_move")
			"act":
				new_button.setup("Act", self, "do_nothing")
			"check":
				new_button.setup("Check", self, "do_nothing")
			"cancel":
				new_button.setup("Close", self, "do_nothing")
			_:
				new_button.setup("Close", self, "do_nothing")


func do_nothing():
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
