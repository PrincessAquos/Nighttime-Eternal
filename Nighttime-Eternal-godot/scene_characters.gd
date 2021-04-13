extends Node

class_name SceneCharacters

const Team = preload("res://char_components/team.gd").Team

var allies:Dictionary
var neutral:Dictionary
var enemies:Dictionary


func add_character(character:Character, team:int):
	match team:
		Team.ALLY:
			allies[character.grid_pos] = character
		Team.NEUTRAL:
			neutral[character.grid_pos] = character
		Team.ENEMY:
			enemies[character.grid_pos] = character
	add_child(character)


func search_for_char(grid_pos:Vector2):
	for dict in [allies, neutral, enemies]:
		if dict.has(grid_pos):
			return dict[grid_pos]
	return null
