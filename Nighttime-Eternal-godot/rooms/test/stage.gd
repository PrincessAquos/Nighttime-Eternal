extends Node2D

class_name Stage

onready var cursor = get_node("Cursor")

var level_map:LevelMap
var move_maps:Node2D
var characters:Node2D

var map_speed = 32
var scroll_dirs = []

enum ScrollDirs {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func _ready():
	
	Game.stage = self
	
	level_map = get_node("Level/TileMap")
	move_maps = get_node("MoveMaps")
	characters = get_node("Characters")
	
	


func _process(delta):
	if scroll_dirs.has(ScrollDirs.UP):
		position.y += 8
	if scroll_dirs.has(ScrollDirs.DOWN):
		position.y -= 8
	if scroll_dirs.has(ScrollDirs.LEFT):
		position.x += 8
	if scroll_dirs.has(ScrollDirs.RIGHT):
		position.x -= 8
	return


func _input(event):
	if event.is_action_pressed("scroll_up"):
		scroll_dirs.append(ScrollDirs.UP)
	if event.is_action_pressed("scroll_down"):
		scroll_dirs.append(ScrollDirs.DOWN)
	if event.is_action_pressed("scroll_left"):
		scroll_dirs.append(ScrollDirs.LEFT)
	if event.is_action_pressed("scroll_right"):
		scroll_dirs.append(ScrollDirs.RIGHT)
		
	if event.is_action_released("scroll_up"):
		scroll_dirs.erase(ScrollDirs.UP)
	if event.is_action_released("scroll_down"):
		scroll_dirs.erase(ScrollDirs.DOWN)
	if event.is_action_released("scroll_left"):
		scroll_dirs.erase(ScrollDirs.LEFT)
	if event.is_action_released("scroll_right"):
		scroll_dirs.erase(ScrollDirs.RIGHT)
