extends TileSet

class_name MoveNodeTileSet

const TEXTURE = preload("res://objects/assets/move_node.png")
const Direction = DirHelper.Direction

const UP_TILE = 0
const LEFT_TILE = 1
const RIGHT_TILE = 2
const DOWN_TILE = 3


func _init(actions):
	# Create a node for every action
	# Create a node for movement only
	create_move_node("Move", Color(0, 0, 255))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create_move_node(type_name, color):
	var tile_id = get_last_unused_tile_id()
	for i in range(0, 4):
		var this_tile = tile_id + i
		create_tile(this_tile)
		tile_set_name(this_tile, type_name + "_" + Direction.keys()[i])
		tile_set_texture(this_tile, TEXTURE)
		tile_set_region(this_tile, Rect2(0, 0, 32, 32))
		tile_set_modulate(this_tile, color)
	return tile_id/4


func get_dir_index(index, direction):
	# Takes in the base index and the direction enum
	# Deduces the proper tile index
	var dir_tile = -1
	match direction:
		Direction.LEFT:
			dir_tile = LEFT_TILE
		Direction.UP:
			dir_tile = UP_TILE
		Direction.RIGHT:
			dir_tile = RIGHT_TILE
		Direction.DOWN:
			dir_tile = DOWN_TILE
		_:
			return -1
			
	return index * 4 + dir_tile


func index_to_dir(tile_index):
	match tile_index % 4:
		LEFT_TILE:
			return Direction.LEFT
		UP_TILE:
			return Direction.UP
		RIGHT_TILE:
			return Direction.RIGHT
		DOWN_TILE:
			return Direction.DOWN
		_:
			return Direction.ERROR
