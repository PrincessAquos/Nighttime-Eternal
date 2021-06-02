extends Node

class_name Action

const DB = preload("res://db/data.cdb")
const DmgMod = DB.Actions.DmgMod
const DmgType = DB.Actions.DmgType

var display_name:String
var perform_func:FuncRef
var damage_func:FuncRef
var defend_func:FuncRef
var dmg_base:int
var dmg_mod:int
var dmg_type:int
var range_min:int
var range_max:int
var range_type:int
var stam_cost:int
var res_cost:int
var usable:bool
#var select_target:FuncRef
#var target
#var perform:FuncRef


func get_damage(user):
	if damage_func == null:
		return 0
	return damage_func.call_func(user, dmg_base)


func get_damage_func():
	match dmg_mod:
		DmgMod.STREN:
			return funcref(ActFuncs, "strength_damage")
		DmgMod.INTEL:
			return funcref(ActFuncs, "intellect_damage")
		_:
			return null


func get_defend_func():
	match(dmg_type):
		DmgType.PHYSICAL:
			return funcref(ActFuncs, "physical_defend")
		DmgType.MAGIC:
			return funcref(ActFuncs, "magic_defend")
		DmgType.ABSOLUTE:
			return funcref(ActFuncs, "absolute_defend")
		DmgType.HEAL:
			return funcref(ActFuncs, "heal_defend")
		_:
			return null


func get_perform_func(act_id):
	var act_lookup = ActFuncs.lookup_act(act_id)
	if act_lookup != null:
		return act_lookup
	match(dmg_type):
		DmgType.PHYSICAL, DmgType.MAGIC, DmgType.ABSOLUTE:
			return funcref(ActFuncs, "perform_attack")
		DmgType.HEAL:
			return funcref(ActFuncs, "perform_heal")
		_:
			return null
	

func _init(action_id:String, stats:Dictionary = {}):
	var db_action = Data.actions.get(action_id)
	display_name = db_action.name
	dmg_base = db_action.dmg_base
	dmg_mod = db_action.dmg_mod
	dmg_type = db_action.dmg_type
	range_min = db_action.range_min
	range_max = db_action.range_max
	range_type = db_action.range_type
	damage_func = get_damage_func()
	defend_func = get_defend_func()
	perform_func = get_perform_func(action_id)
	stam_cost = db_action.cost_stam
	res_cost = db_action.cost_resource
	usable = true


func perform(user, target):
	perform_func.call_func(user, damage_func, dmg_base, target, defend_func)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
