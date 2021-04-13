extends Object

class_name Stat

var base_val:int
var growth:float
var true_val:float
var val:int

func _init(level, base_value, growth_rate):
	base_val = base_value
	growth = growth_rate
	true_val = float(base_val) + (float(level) - 1) * growth
	val = round(true_val)

func level_up():
	true_val += growth
	val = round(true_val)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
