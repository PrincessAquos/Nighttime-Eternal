extends Area2D

class_name Cursor

onready var test_label = get_node("Current Tile")
onready var levelmap:LevelMap = get_node("../Level/TileMap")
onready var stage:Stage = get_node("../")

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
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("click"):
		mouse_click()


func get_mouse_grid_pos():
	var dif = get_global_mouse_position() - get_parent().get_local_mouse_position()
	var mouse_pos = get_global_mouse_position() - dif
	return levelmap.world_to_map(mouse_pos)

func update_grid_pos():
	var new_grid_pos = get_mouse_grid_pos()
	if new_grid_pos != grid_pos:
		var dir = DirHelper.get_dir_from_vector(new_grid_pos - grid_pos)
		grid_pos = new_grid_pos
		position = levelmap.map_to_world(grid_pos)
		get_node("Grid Pos").text = "X: " + str(grid_pos.x) + ", Y: " + str(grid_pos.y)
		
		tile = levelmap.get_tile(grid_pos)
		test_label.text = tile.name
		
		update_char_selection()
		
		if moving_char != null:
			
			path.add_path(grid_pos, dir)


func update_char_selection():
	var scene_characters = stage.characters
	var found_char = scene_characters.search_for_char(grid_pos)
	if selected_char != found_char:
		if selected_char != null and selected_char != clicked_char:
			print(selected_char.char_name)
			selected_char.move_map.hide_moves()
		if found_char != null and found_char != clicked_char:
			found_char.move_map.hint_moves()
		selected_char = found_char
		selected_char_changed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if follow:
		var new_grid_pos = get_mouse_grid_pos() 
		if new_grid_pos != grid_pos:
			update_grid_pos()
	elif moving_char != null:
		if moving_char.move_path == null:
			end_move()
	# position = Vector2(floor(mouse_pos.x/32)*32, floor(mouse_pos.y/32)*32)


func mouse_click():
	if selected_char != null:
		clicked_char_changed = true
		if clicked_char == null:
			click_char()
		elif clicked_char == selected_char:
			un_click_char()
	elif moving_char != null:
		if !path.empty():
			follow = false
			moving_char.start_moving(path)
	return


func click_char():
	clicked_char = selected_char
	follow = false
	start_move()


func un_click_char():
	path.clear()
	clicked_char.move_map.hint_moves()
	clicked_char = null
	moving_char = null
	path.queue_free()
	path = null


func start_move():
	clicked_char.move_map.activate_moves()
	moving_char = clicked_char
	path = PathTileMap.new(moving_char.move_map)
	get_parent().add_child(path)
	follow = true


func end_move():
	stage.characters.place_in_grid(moving_char)
	moving_char.refresh_movemap()
	follow = true
	update_char_selection()
	un_click_char()
	update_grid_pos()


func most_efficient_path():
	var move_node = clicked_char.move_map.get_cellv(grid_pos)
	
	
	get_node("Direction").text = clicked_char.move_map.tile_set.tile_get_name(move_node)
	pass


func ui_updated():
	selected_char_changed = false
	clicked_char_changed = false
