extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var value:int = 0 setget set_value

onready var icon:TextureRect = get_node("Value")

var states = [
	null,
	preload("res://ui/char_class_rank_1.png"),
	preload("res://ui/char_class_rank_2.png"),
	preload("res://ui/char_class_rank_3.png"),
	preload("res://ui/char_class_rank_4.png"),
	preload("res://ui/char_class_rank_5.png"),
	preload("res://ui/char_class_rank_6.png"),
	preload("res://ui/char_class_rank_7.png"),
	preload("res://ui/char_class_rank_8.png"),
	preload("res://ui/char_class_rank_9.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_value(0)
	return

func set_value(new_val):
	value = new_val % 10
	
	var sprite = states[value]
	
	if sprite != null:
		icon.texture = states[value]
		icon.visible = true
	else:
		icon.visible = false
