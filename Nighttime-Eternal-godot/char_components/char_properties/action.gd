extends Node

class_name Action

const DB = preload("res://db/data.cdb")

var display_name:String
var dmg:int
var stam_cost:int
var res_cost:int
var usable:bool
#var select_target:FuncRef
#var target
#var perform:FuncRef


func _init(action_id:String, stats:Dictionary = {}):
	var db_action = Data.actions.get(action_id)
	display_name = db_action.name
	dmg = db_action.dmg_base
	stam_cost = db_action.cost_stam
	res_cost = db_action.cost_resource
	usable = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
