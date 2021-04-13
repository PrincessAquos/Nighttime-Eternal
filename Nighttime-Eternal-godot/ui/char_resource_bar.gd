extends MarginContainer

# Declare member variables here. Examples:
var active = false setget active_set

var value_label:Label
var bar:TextureProgress

var curr_val = 10 setget curr_val_set
var max_val = 20 setget max_val_set

# Called when the node enters the scene tree for the first time.
func _ready():
	value_label = get_node("Value")
	bar = get_node("IconBarAdjust/IconBarRow/BarAdjust/Bar")
	bar.value = curr_val
	bar.max_value = max_val
	value_label.text = String(curr_val) + "/" + String(max_val)
	
	curr_val_set(curr_val)
	max_val_set(max_val)
	active_set(active)
	return

func curr_val_set(new_val):
	curr_val = new_val
	bar.value = curr_val
	value_label.text = String(curr_val) + "/" + String(max_val)

func max_val_set(new_val):
	max_val = new_val
	bar.max_value = max_val
	value_label.text = String(curr_val) + "/" + String(max_val)

func active_set(new_val):
	active = new_val
	
	value_label.visible = active
	
	if active:
		bar.value = curr_val
	else:
		bar.value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass
