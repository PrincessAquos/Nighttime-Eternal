extends MarginContainer

var active = false setget active_set

const VALUE_PATH_1 = "MarginContainer/VBoxContainer/"
const VALUE_PATH_2 = "/ValueMargin/Value"

onready var stat_labels = {
	"strength": get_node(VALUE_PATH_1 + "Str" + VALUE_PATH_2),
	"defense": get_node(VALUE_PATH_1 + "Def" + VALUE_PATH_2),
	"intellect": get_node(VALUE_PATH_1 + "Int" + VALUE_PATH_2),
	"resilience": get_node(VALUE_PATH_1 + "Res" + VALUE_PATH_2),
	"agility": get_node(VALUE_PATH_1 + "Agi" + VALUE_PATH_2),
	"luck": get_node(VALUE_PATH_1 + "Lck" + VALUE_PATH_2),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	for stat in stat_labels:
		stat_labels[stat].visible = active

func stat_labels_update(stat_vals):
	for stat in stat_labels:
		var val = stat_vals[stat].val
		var label = stat_labels[stat]
		label.text = String(val)

func active_set(new_val):
	active = new_val
	for stat in stat_labels:
		stat_labels[stat].visible = active

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
