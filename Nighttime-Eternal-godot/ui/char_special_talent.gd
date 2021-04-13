extends MarginContainer

var level:int = 1 setget level_set
var experience:int = 0 setget experience_set
var active = false setget active_set

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var exp_bar:TextureProgress
var exp_label:Label
var level_label:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	exp_bar = get_node("CutieMarkEXPMargin/EXPBar")
	exp_label = get_node("ExpNumberMargin/Experience")
	level_label = get_node("LevelBGMargin/LevelLabelMargin/Level")
	
	experience_set(experience)
	level_set(level)
	active_set(active)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func level_set(new_val):
	level = new_val
	level_label.text = String(level)

func experience_set(new_val):
	new_val = int(clamp(new_val, 0, 100))
	experience = new_val
	exp_label.text = String(experience)
	exp_bar.value = experience

func active_set(new_val):
	active = new_val
	if active:
		exp_bar.value = experience
	else:
		exp_bar.value = 0
	
	exp_label.visible = active
	level_label.visible = active
