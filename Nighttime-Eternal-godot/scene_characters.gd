extends Node

class_name SceneCharacters

const Team = preload("res://char_components/team.gd").Team

onready var allies:BiDict = BiDict.new()
onready var neutral:BiDict = BiDict.new()
onready var enemies:BiDict = BiDict.new()

func add_character(character:Character):
	place_in_grid(character)
	add_child(character)


func place_in_grid(character):
	match character.team:
		Team.ALLY:
			allies.set_item(character.grid_pos, character)
		Team.NEUTRAL:
			neutral.set_item(character.grid_pos, character)
		Team.ENEMY:
			enemies.set_item(character.grid_pos, character)


func search_for_char(grid_pos:Vector2):
	for bidict in [allies, neutral, enemies]:
		if bidict.has(grid_pos):
			return bidict.get_by_key(grid_pos)
	return null
