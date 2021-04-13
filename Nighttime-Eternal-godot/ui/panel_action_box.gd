extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var action_buttons = get_node("ScrollMargin/ScrollContainer/ListMargin/ActionList").get_children()
var scene_action_button:PackedScene = preload("res://ui/panel_action.tscn")
var active = false setget active_set

func assign_buttons(action_list:Array):
	var i = 0
	for action_button in action_buttons:
		if i < action_list.size():
			action_button.assign_action(action_list[i])
		else:
			action_button.assign_action(null)
		i += 1
	return

# Called when the node enters the scene tree for the first time.
func _ready():
	for act_button in action_buttons:
		act_button.visible = false
	action_buttons[0].visible = true
	
	test()
	return # Replace with function body.

func test():
	var test_list = [
		Action.new("buck"),
		Action.new("buck"),
		Action.new("buck"),
		Action.new("magic_missile"),
		Action.new("buck"),
		Action.new("magic_missile"),
		Action.new("magic_missile"),
	]
	assign_buttons(test_list)

func active_set(new_val):
	active = new_val
	if !active:
		for button in action_buttons:
			button.visible = false
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
