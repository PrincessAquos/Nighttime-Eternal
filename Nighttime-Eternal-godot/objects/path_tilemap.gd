extends TileMap

class_name PathTileMap

const Direction = DirHelper.Direction

var path:Array
var movemap:MoveMap
var stam_cost:int = 0

enum Tile {UP, LEFT, RIGHT, DOWN, HORI, VERT, TOPLEFT, TOPRIGHT, BOTLEFT, BOTRIGHT, ERROR}

func _init(move_map:MoveMap):
	movemap = move_map
	path = []
	stam_cost = 0
	tile_set = preload("res://objects/path_tileset.tres")
	cell_size = Vector2(32, 32)
	z_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func empty():
	return path.empty()


func reset_path():
	path.clear()
	stam_cost = 0
	clear()


func add_path(pos:Vector2, dir):
	if pos == movemap.character.grid_pos:
		reset_path()
	elif stam_cost > movemap.character.stats.stamina.curr_val:
		most_efficient_path(pos)
	elif pos in path:
		var index = path.find(pos)
		var removed = path.slice(index+1, path.size()-1)
		for cut_pos in removed:
			stam_cost -= movemap.level_tilemap.get_tile(cut_pos).cost
			set_cellv(cut_pos, -1)
		var new_path = path.slice(0, index)
		path = new_path
		var prev_pos
		if path.size() > 1:
			prev_pos = path[path.size()-2]
		else:
			prev_pos = movemap.character.grid_pos
		set_cellv(pos, path_tile_type(DirHelper.get_dir_from_vector(path.back() - prev_pos), null))
	else:
		stam_cost += movemap.level_tilemap.get_tile(pos).cost
		if !empty():
			set_cellv(path.back(), get_updated_end_tile(dir))
		var tile = path_tile_type(dir, null)
		set_cellv(pos, tile)
		path.push_back(pos)
	return


func add_path_reverse(pos:Vector2, dir_in, dir_out):
	stam_cost += movemap.level_tilemap.get_tile(pos).cost
	path.push_front(pos)
	var tile = path_tile_type(dir_in, dir_out)
	print("Setting tile " + str(tile))
	set_cellv(pos, tile)


func path_tile_type(dir_in, dir_out):
	if dir_out == null:
		match dir_in:
			Direction.LEFT:
				return Tile.LEFT
			Direction.RIGHT:
				return Tile.RIGHT
			Direction.UP:
				return Tile.UP
			Direction.DOWN:
				return Tile.DOWN
			_:
				return Tile.ERROR
	else:
		match dir_in - dir_out:
			0:
				match int(abs(dir_in)):
					1:
						return Tile.HORI
					2:
						return Tile.VERT
					_:
						return Tile.ERROR
			1:
				return Tile.BOTLEFT
			-1:
				return Tile.TOPRIGHT
			3:
				return Tile.BOTRIGHT
			-3:
				return Tile.TOPLEFT
			_:
				return Tile.ERROR


func get_updated_end_tile(dir_out):
	var prev_tile = get_cellv(path.back())
	var dir_in
	match prev_tile:
			Tile.LEFT:
				dir_in = Direction.LEFT
			Tile.RIGHT:
				dir_in = Direction.RIGHT
			Tile.UP:
				dir_in = Direction.UP
			Tile.DOWN:
				dir_in = Direction.DOWN
			_:
				dir_in = Direction.ERROR
	return path_tile_type(dir_in, dir_out)


func most_efficient_path(pos:Vector2):
	reset_path()
	var dir_out = null
	if movemap.get_cellv(pos) == -1:
		return
	while pos != movemap.character.grid_pos:
		print("path happenin")
		var optimal_dir = movemap.get_tile_dir(pos)
		var dir_in = DirHelper.get_opposite(optimal_dir)
		add_path_reverse(pos, dir_in, dir_out)
		dir_out = dir_in
		pos += DirHelper.get_dir_vector(optimal_dir)
