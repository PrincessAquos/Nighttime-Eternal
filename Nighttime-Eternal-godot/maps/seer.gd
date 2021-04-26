extends Sprite

const Direction = DirHelper.Direction
# Declare member variables here. Examples:
# var a = 2
# var b = "text

onready var cursor = get_node("../Cursor")
onready var level_tilemap = get_node("../Level/TileMap")
onready var sightmap:TileMap = get_node("sightmap")
var grid_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	grid_pos = position/32
	trace_sight(6)
	return

func _process(delta):
	sightmap.clear()
	trace_sight(6)

func create_diamond(size):
	match(size):
		1:
			diamond_size_1()
		2:
			diamond_size_2()
		_:
			pass


func diamond_size_1():
	sightmap.set_cellv(grid_pos + Vector2.UP, 10)
	sightmap.set_cellv(grid_pos + Vector2.DOWN, 10)
	sightmap.set_cellv(grid_pos + Vector2.LEFT, 10)
	sightmap.set_cellv(grid_pos + Vector2.RIGHT, 10)
	
	
func diamond_size_2():
	sightmap.set_cellv(grid_pos + 2 * Vector2.UP, 10)
	sightmap.set_cellv(grid_pos + Vector2.UP + Vector2.LEFT, 10)
	sightmap.set_cellv(grid_pos + 2 * Vector2.DOWN, 10)
	sightmap.set_cellv(grid_pos + Vector2.UP + Vector2.RIGHT, 10)
	sightmap.set_cellv(grid_pos + 2 * Vector2.LEFT, 10)
	sightmap.set_cellv(grid_pos + Vector2.DOWN + Vector2.LEFT, 10)
	sightmap.set_cellv(grid_pos + 2 * Vector2.RIGHT, 10)
	sightmap.set_cellv(grid_pos + Vector2.DOWN + Vector2.RIGHT, 10)


func trace_sight(size):
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
			if is_obstructed(this_pos):
				break
			# if it is, break
			# if not, place tile and proceed
			sightmap.set_cellv(this_pos, 10)
			
			# left diagonal
			var diag1_count = 0
			var diag1_pos = this_pos
			var last_dir = main_dir
			while diag1_count < main_size and diag1_count < diag1_max:
				if last_dir == main_dir:
					last_dir = diag1_dir
					diag1_pos += DirHelper.get_dir_vector(diag1_dir)
					# check if obstructed
					if is_obstructed(diag1_pos):
						break
					# if it is, break
					# if not, place tile and proceed
					sightmap.set_cellv(diag1_pos, 10)
				
				elif last_dir == diag1_dir:
					last_dir = main_dir
					diag1_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if is_obstructed(diag1_pos):
						break
					# if it is, break
					# if not, place tile and proceed
					sightmap.set_cellv(diag1_pos, 10)
				
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
					if is_obstructed(diag2_pos):
						break
					# if it is, break
					# if not, place tile and proceed
					sightmap.set_cellv(diag2_pos, 10)
				
				elif last_dir == diag2_dir:
					last_dir = main_dir
					diag2_pos += DirHelper.get_dir_vector(main_dir)
					# check if obstructed
					if is_obstructed(diag2_pos):
						break
					# if it is, break
					# if not, place tile and proceed
					sightmap.set_cellv(diag2_pos, 10)
				
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
	if cursor.grid_pos == pos:
		return true
	var tile = level_tilemap.get_tile(pos)
	return tile.wall_height > 0


func trace_sight_left_old(size):
	var queue = Queue.new()
	queue.enqueue(grid_pos, {"main_dir": Direction.ORIGIN, "sub_dir": Direction.ORIGIN, "last_dir": Direction.ERROR}, size)
	
	while !queue.empty():
		var item = queue.dequeue()
		
		print(String(item))
		
		var this_pos = item.pos
		var dist_left = item.stam
		var main_dir = item.data.main_dir
		var last_dir = item.data.last_dir
		var sub_dir = item.data.sub_dir
		var move_dir
		var dirs
		
		if main_dir == Direction.ORIGIN or sub_dir == last_dir:
			main_dir = Direction.LEFT
			dirs = [Direction.LEFT]
		elif sub_dir != Direction.ORIGIN:
			dirs = [main_dir, sub_dir]
		else:
			dirs = [main_dir, Direction.UP, Direction.DOWN]
		
		for qdir in dirs:
			
			var new_sub_dir
			if sub_dir == Direction.ORIGIN and qdir != main_dir:
				new_sub_dir = qdir
			else:
				new_sub_dir = sub_dir
				
			
			var new_pos = this_pos + DirHelper.get_dir_vector(qdir)
			var tile = level_tilemap.get_tile(new_pos)
			
			if tile.wall_height <= 0:
					# Get the stamina remaining on this journey
					#var stam_cost = tile.cost
				var new_stam = dist_left - 1
					
					
				# If this is the best path yet, set a cell and queue
				if new_sub_dir == Direction.UP:
					sightmap.set_cellv(new_pos, 0)
				elif new_sub_dir == Direction.DOWN:
					sightmap.set_cellv(new_pos, 3)
				else:
					sightmap.set_cellv(new_pos, 10)
				if new_stam > 0:
					queue.enqueue(new_pos, {"main_dir": main_dir, "sub_dir":new_sub_dir, "last_dir": qdir}, new_stam)
		
		#if last_dir == Direction.ORIGIN or last_dir == sub_dir:
		#	move_dir = Direction.LEFT
		#elif sub_dir == Direction.ORIGIN or last_dir == main_dir:
		#	sub_dir = Direction.UP
		#	move_dir = sub_dir
		#this_pos += DirHelper.get_dir_vector(move_dir)
		#sightmap.set_cellv(this_pos, 10)
		#last_dir = move_dir
		#size -= 1

