extends Area2D

class_name Cursor

export var submenu_scene:PackedScene

onready var test_label = get_node("Current Tile")

var follow:bool = true
var tile:Dictionary
var selected_char:Character
var clicked_char:Character
var moving_char:Character
var grid_pos:Vector2
var path:PathTileMap

var selected_char_changed = false
var clicked_char_changed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.cursor = self
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if should_follow():
		update_grid_pos()
	if moving_char != null:
		if moving_char.move_path == null:
			end_move()
	# position = Vector2(floor(mouse_pos.x/32)*32, floor(mouse_pos.y/32)*32)


func _input(event):
	if Game.submenu == null and event.is_action_pressed("click"):
		mouse_click()


func should_follow():
	return Game.submenu == null and moving_char == null


func get_mouse_grid_pos():
	var stage = Game.stage
	var levelmap = Game.levelmap
	var mouse_pos = get_global_mouse_position()
	if stage != null:
		var dif = get_global_mouse_position() - stage.get_local_mouse_position()
		mouse_pos -= dif
	if levelmap != null:
		return levelmap.world_to_map(mouse_pos)
	else:
		return Vector2(0,0)
		

func update_grid_pos():
	var new_grid_pos = get_mouse_grid_pos()
	if new_grid_pos != grid_pos:
		grid_pos = new_grid_pos
		position = Game.levelmap.map_to_world(grid_pos)
		get_node("Grid Pos").text = "X: " + str(grid_pos.x) + ", Y: " + str(grid_pos.y)
		
		tile = Game.levelmap.get_tile(grid_pos)
		test_label.text = tile.name
		
		update_char_selection()
		
		if clicked_char != null:
			
			path.add_path(grid_pos)


func update_char_selection():
	var found_char = get_char(grid_pos)
	if selected_char != found_char:
		if selected_char != null and selected_char != clicked_char:
			print(selected_char.char_name)
			selected_char.move_map.hide_moves()
		if found_char != null and found_char != clicked_char:
			found_char.move_map.hint_moves()
		selected_char = found_char
		selected_char_changed = true


func get_char(in_grid_pos):
	var characters = get_tree().get_nodes_in_group("character")
	for character in characters:
		if character.grid_pos == in_grid_pos:
			return character
	

#func get_char_complicated(in_grid_pos):
#	return Game.character_parent.search_for_char(grid_pos)


func mouse_click():
	if selected_char != null:
		if clicked_char == null:
			click_char()
		elif clicked_char == selected_char:
			cancel_move()
	elif clicked_char != null:
		if !path.empty():
			moving_char = clicked_char
			moving_char.start_moving(path)
	return


func click_char():
	var submenu = submenu_scene.instance()
	Game.register_submenu(submenu)
	submenu.setup(["move", "act", "check", "cancel"])


func un_click_char():
	path.clear()
	clicked_char.move_map.hint_moves()
	clicked_char = null
	moving_char = null
	path.queue_free()
	path = null
	


func start_move():
	clicked_char_changed = true
	clicked_char = selected_char
	clicked_char.move_map.activate_moves()
	path = PathTileMap.new(clicked_char.move_map)
	get_parent().add_child(path)
	follow = true


func cancel_move():
	selected_char = clicked_char
	clicked_char.move_map.hint_moves()
	clicked_char = null
	path.queue_free()
	path = null
	var submenu = submenu_scene.instance()
	Game.register_submenu(submenu)
	submenu.setup(["move", "act", "check", "cancel"])


func end_move():
	moving_char.refresh_movemap()
	follow = true
	moving_char = null
	cancel_move()


func most_efficient_path():
	var move_node = clicked_char.move_map.get_cellv(grid_pos)
	
	
	get_node("Direction").text = clicked_char.move_map.tile_set.tile_get_name(move_node)
	pass


func ui_updated():
	selected_char_changed = false
	clicked_char_changed = false
