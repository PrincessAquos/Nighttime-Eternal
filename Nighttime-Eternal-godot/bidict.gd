extends Object

class_name BiDict

var bd:Dictionary
var reverse:Dictionary
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func get_by_key(key):
	return bd[key]


func get_by_value(value):
	return reverse[value]


func has(value):
	return bd.has(value) || reverse.has(value)


func clear():
	bd.clear
	reverse.clear


func size():
	return bd.size()


func set_item(key, value):
	if key in bd:
		reverse.erase(bd[key])
		bd.erase(key)
	if value in reverse:
		bd.erase(reverse[value])
		reverse.erase(value)
	reverse[value] = key
	bd[key] = value


func erase(key_val):
	if key_val in bd:
		reverse.erase(bd[key_val])
		bd.erase(key_val)
	elif key_val in reverse:
		bd.erase(reverse[key_val])
		reverse.erase(key_val)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
