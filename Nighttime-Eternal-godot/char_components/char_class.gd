extends Object

class_name CharacterClass

var identifier:String
var title:String
var rank:int
var learnset:Dictionary = {
	"rank0": null,
	"rank3": null,
	"rank6": null,
	"rank9": null,
}

func _init(class_id, in_rank = 4):
	identifier = class_id
	title = Data.classes.get(class_id).name
	rank = in_rank
	learnset["rank0"] = {
			"action": Data.classactionlearnsets.get(identifier).lv0,
		}
	learnset["rank3"] = {
			"action": Data.classactionlearnsets.get(identifier).lv3,
		}
	learnset["rank6"] = {
			"action": Data.classactionlearnsets.get(identifier).lv6,
		}
	learnset["rank9"] = {
			"action": Data.classactionlearnsets.get(identifier).lv9,
		}
	return


func rank_up():
	rank += 1


func get_actions():
	var act_array = []
	var act_id
	if rank >= 0:
		act_id = Data.classactionlearnsets.get(identifier).lv0
		if act_id != "":
			act_array.append(Action.new(act_id))
	if rank >= 3:
		act_id = Data.classactionlearnsets.get(identifier).lv3
		if act_id != "":
			act_array.append(Action.new(act_id))
	if rank >= 6:
		act_id = Data.classactionlearnsets.get(identifier).lv6
		if act_id != "":
			act_array.append(Action.new(act_id))
	if rank >= 9:
		act_id = Data.classactionlearnsets.get(identifier).lv9
		if act_id != "":
			act_array.append(Action.new(act_id))
	return act_array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(class_id):
	
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
