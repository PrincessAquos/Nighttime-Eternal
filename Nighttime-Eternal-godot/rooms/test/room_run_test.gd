extends Node2D

var ponies = []
onready var level_tilemap = get_node("LevelMap")
onready var movemap = get_node("MoveMaps")

func _ready():
	var character_scene = preload("res://char_components/character.tscn")
	
	var pony_names = [
		"twilight",
		"applejack",
		"sunset",
	]
	var pos = 0
	for pony_name in pony_names:
		var inst = character_scene.instance()
		ponies.append(inst)
		inst.setup(pony_name, Vector2(pos, 0), level_tilemap, movemap)
		add_child(inst)
		pos += 32
	return


func _on_Run_Animation_toggled(button_pressed):
	for pony in ponies:
		pony.appearance.is_running = button_pressed
	return
