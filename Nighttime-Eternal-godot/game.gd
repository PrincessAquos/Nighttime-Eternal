extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var cursor:Cursor = null setget set_cursor
var battle_screen = null setget set_battle_screen
var stage:Stage = null setget set_stage
var levelmap:LevelMap = null setget set_levelmap
var movemap_parent = null setget set_movemap_parent
var character_parent = null setget set_character_parent

var setup_done = false
var sightmap:SightMap = null

var submenu:SubMenu = null
var action_to_test:Action
var user
var target

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func is_ready():
	return cursor != null and levelmap != null and movemap_parent != null and character_parent != null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !setup_done and is_ready():
		sightmap = SightMap.new(levelmap)
		stage.add_child(sightmap)
		var charspawners = get_tree().get_nodes_in_group("charspawn")
		for charspawn in charspawners:
			charspawn.spawn_character()
		setup_done = true
	return


func _input(event):
	if event.is_action_pressed("action_test"):
		if action_to_test == null:
			user = cursor.selected_char
			action_to_test = user.actions[0]
			sightmap.activate(user, action_to_test)
			print("Testing performing: " + action_to_test.display_name)
		elif cursor.selected_char == user:
			sightmap.reset()
			user = null
			action_to_test = null
			target = null
		else:
			var sight_tile = sightmap.get_cellv(cursor.grid_pos)
			if sight_tile != -1 and cursor.selected_char != null:
				target = cursor.selected_char
				action_to_test.perform(user, target)
				print("Performed: " + action_to_test.display_name)
				user = null
				action_to_test = null
				target = null
				sightmap.reset()
		

func register_submenu(in_submenu):
	if submenu != null:
		submenu.free()
	submenu = in_submenu
	battle_screen.top_level_ui.add_child(submenu)

func submenu_close():
	submenu.queue_free()
	submenu = null

func set_cursor(id):
	if cursor != null:
		cursor.free()
	cursor = id


func set_battle_screen(id):
	if battle_screen != null:
		battle_screen.free()
	battle_screen = id


func set_stage(id):
	if stage != null:
		stage.free()
	stage = id


func set_levelmap(id):
	if levelmap != null:
		levelmap.free()
	levelmap = id


func set_movemap_parent(id):
	if movemap_parent != null:
		movemap_parent.free()
	movemap_parent = id


func set_character_parent(id):
	if character_parent != null:
		character_parent.free()
	character_parent = id
