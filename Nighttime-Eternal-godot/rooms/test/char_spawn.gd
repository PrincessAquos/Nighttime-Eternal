extends Sprite

class_name CharacterSpawn

const Team = preload("res://char_components/team.gd").Team

export var character = "null"
export var team = Team.ALLY

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("charspawn")
	pass

func spawn_character():
	if character != "null":
		var character_scene = preload("res://char_components/character.tscn")
		var inst = character_scene.instance()
		inst.setup(character, position, team)
		Game.character_parent.add_character(inst)
	queue_free()
