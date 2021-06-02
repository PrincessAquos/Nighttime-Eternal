extends TileMap

class_name SightMap
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Direction = DirHelper.Direction
const RangeType = Data.Actions.RangeType

var grid_pos:Vector2
var type:int
var size:int
var level_map:LevelMap


func _init(level_tilemap, in_grid_pos = Vector2(0, 0), in_size = 0):
	grid_pos = in_grid_pos
	size = in_size
	level_map = level_tilemap
	
	cell_size.x = 32
	cell_size.y = 32
	tile_set = preload("res://objects/path_tileset.tres")


func activate(in_character, action:Action):
	print("AAAAAA")
	grid_pos = in_character.grid_pos
	type = action.range_type
	size = action.range_max
	trace_sight()


func trace_sight():
	reset()
	var dirs = [Direction.LEFT, Direction.RIGHT, Direction.UP, Direction.DOWN]
	for dir in dirs:
		var main_size = size
		var diag1_max = size
		var diag2_max = size
		var this_pos = grid_pos
		var main_dir = dir
		var new_dirs = dirs.duplicate(true)
		new_dirs.erase(dir)
		new_dirs.erase(DirHelper.get_opposite(dir))
		var diag1_dir = new_dirs[0]
		var diag2_dir = new_dirs[1]
		while main_size > 0:
			this_pos += DirHelper.get_dir_vector(main_dir)
			main_size -= 1
			
			# check if obstructed
			if is_obstructed(this_pos) and type != RangeType.LINE_OF_SIGHT:
				break
			# if it is, break
			# if not, place tile and proceed
			place_sight(this_pos)
			
			if is_obstructed(this_pos):
				break
			
			# left diagonal
			var diag1_count = 0
			var diag1_pos = this_pos
			var last_dir = main_dir
			while diag1_count < main_size and diag1_count < diag1_max:
				if last_dir == main_dir:
					last_dir = diag1_dir
					diag1_pos += DirHelper.get_dir_vector(diag1_dir)
					# check if obstructed
					if is_obstructed(diag1_pos) and type != RangeType.LINE_OF_SIGHT:
						break
					# if it is, break
					# if not, place tile and proceed
					place_sight(diag1_pos)
					
					if is_obstructed(diag1_pos):
						break
				
				elif last_dir == diag1_dir:
					last_dir = main_dir
					diag1_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if is_obstructed(diag1_pos) and type != RangeType.LINE_OF_SIGHT:
						break
					# if it is, break
					# if not, place tile and proceed
					place_sight(diag1_pos)
					if is_obstructed(diag1_pos):
						break
				
				diag1_count += 1
			if diag1_count == diag1_max:
				if last_dir == main_dir:
					last_dir = diag1_dir
					diag1_pos += DirHelper.get_dir_vector(diag1_dir)
					# check if obstructed
					if is_obstructed(diag1_pos):
						break
					diag1_max += 1
				
				elif last_dir == diag1_dir:
					last_dir = main_dir
					diag1_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if is_obstructed(diag1_pos):
						break
					diag1_max += 1
			else:
				diag1_max = diag1_count
			# right diagonal
			var diag2_count = 0
			var diag2_pos = this_pos
			last_dir = main_dir
			while diag2_count < main_size and diag2_count < diag2_max:
				if last_dir == main_dir:
					last_dir = diag2_dir
					diag2_pos += DirHelper.get_dir_vector(diag2_dir)
					# check if obstructed
					if is_obstructed(diag2_pos) and type != RangeType.LINE_OF_SIGHT:
						break
					# if it is, break
					# if not, place tile and proceed
					place_sight(diag2_pos)
					if is_obstructed(diag2_pos):
						break
				
				elif last_dir == diag2_dir:
					last_dir = main_dir
					diag2_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if is_obstructed(diag2_pos) and type != RangeType.LINE_OF_SIGHT:
						break
					# if it is, break
					# if not, place tile and proceed
					place_sight(diag2_pos)
					if is_obstructed(diag2_pos):
						break
				
				diag2_count += 1
			
			if diag2_count == diag2_max:
				if last_dir == main_dir:
					last_dir = diag2_dir
					diag2_pos += DirHelper.get_dir_vector(diag2_dir)
					# check if obstructed
					if !is_obstructed(diag2_pos):
						diag2_max += 1
				
				elif last_dir == diag2_dir:
					last_dir = main_dir
					diag2_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if !is_obstructed(diag2_pos):
						diag2_max += 1
			else:
				diag2_max = diag2_count


func is_obstructed(pos):
	var tile = level_map.get_tile(pos)
	match(type):
		RangeType.SAME_ELEVATION:
			return tile.wall_height != level_map.get_tile(grid_pos).wall_height
		RangeType.LINE_OF_SIGHT:
			return tile.wall_height > level_map.get_tile(grid_pos).wall_height
		_:
			return tile.wall_height > level_map.get_tile(grid_pos).wall_height


func place_sight(pos):
	print("sight placed: " + String(pos))
	set_cellv(pos, 0)


func reset():
	clear()
