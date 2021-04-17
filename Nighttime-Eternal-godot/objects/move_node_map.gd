extends TileMap

class_name MoveMap

const Direction = DirHelper.Direction

const HINT_OPACITY = 0.1
const ACTIVE_OPACITY = 0.6

var level_tilemap:LevelMap
var character

# var pqueue:PQueue


func _init(lvl_tilemap:TileMap, in_character):
	level_tilemap = lvl_tilemap
	character = in_character
	visible = false
	tile_set = MoveNodeTileSet.new(in_character.actions)
	cell_size = Vector2(32, 32)
	generate_move_map(in_character.stats.stamina.curr_val, in_character.actions)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func generate_move_map(stamina:int, actions):
	clear()
	var pqueue = PQueue.new()
	# pqueue = PQueue.new()
	pqueue.enqueue(character.grid_pos, Direction.ORIGIN, stamina)
	while !pqueue.empty():
		var item = pqueue.dequeue()
		
		var dirs = [Direction.LEFT, Direction.UP, Direction.DOWN, Direction.RIGHT]
		var prev_dir_idx = dirs.find(item.dir)
		if prev_dir_idx != -1:
			dirs.remove(prev_dir_idx)
		
		# Queue in all valid directions
		for qdir in dirs:
			var new_pos = item.pos + DirHelper.get_dir_vector(qdir)
			var tile = level_tilemap.get_tile(new_pos)
			
			if tile.wall_height == 0:
				# Get the stamina remaining on this journey
				var stam_cost = tile.cost
				var new_stam = item.stam - stam_cost
				
				# Get a potential preexisting max stamina for this tile
				var old_stam = 0
				var node_data = pqueue.get_node_data(new_pos)
				if node_data != null:
					old_stam = node_data.stam
				
				# If this is the best path yet, set a cell and queue
				if new_stam >= old_stam:
					var opp_dir = DirHelper.get_opposite(qdir)
					set_cellv_mm(new_pos, 0, opp_dir)
					if new_stam > 0:
						pqueue.enqueue(new_pos, opp_dir, new_stam)
	pass


func set_cell_mm(x: int, y: int, tile: int, direction: int,
		flip_x: bool = false, flip_y: bool = false, transpose: bool = false, 
		autotile_coord: Vector2 = Vector2( 0, 0 )):
	
	set_cell(x, y, tile_set.get_dir_index(tile, direction), 
			flip_x, flip_y, transpose, autotile_coord)


func set_cellv_mm(position: Vector2, tile: int, direction: int,
		flip_x: bool = false, flip_y: bool = false, transpose: bool = false):
	
	set_cellv(position, tile_set.get_dir_index(tile, direction),
			flip_x, flip_y, transpose)


func most_efficient_path(pos:Vector2):
	var arr = []
	while pos != character.grid_pos:
		arr.append(pos)
		var dir = get_tile_dir(pos)
		if dir != Direction.ERROR:
			pos += DirHelper.get_dir_vector(dir)
		else:
			return null
	print(arr)
	return arr


func get_tile_dir(pos:Vector2):
	return tile_set.index_to_dir(get_cellv(pos))


func activate_moves():
	modulate.a = ACTIVE_OPACITY
	visible = true


func hint_moves():
	modulate.a = HINT_OPACITY
	visible = true


func hide_moves():
	visible = false


class PQueue:
	# The object will free itself when there are no longer any references to it
	extends Reference
	
	var queue:Array
	var node_data:Dictionary
	
	# storing a move tile
	# {Vector2 pos (identifying info), Direction enum dir, int stam}
	
	func empty():
		return queue.empty()
	
	
	func get_node_data(pos:Vector2):
		if node_data.has(pos):
			return node_data[pos]
		else:
			return null
	
	
	func enqueue(pos:Vector2, dir:int, stam:int):
		# Has this tile been added to the queue before?
		if node_data.has(pos):
			# If it's in the queue right now, remove it
			var old_stam = node_data[pos].stam
			var old_idx = queue.bsearch_custom([pos, old_stam], self, "cmp_priority")
			# Note that bsearch expects inserts
			# if the old item is greater than every item in queue
			# it returns the array size so you can insert at the end
			# however, here, we're only looking for the specific pos value
			if old_idx != queue.size():
				if pos == queue[old_idx][0]:
					# remove it if found
					queue.remove(old_idx)
		
		# This is either a new tile, or a more efficient path
		# Update node data and add to queue
		node_data[pos] = {"dir": dir, "stam": stam}
		# Find a spot to insert it
		var idx = queue.bsearch_custom([pos, stam], self, "cmp_priority")
		# Do Insert 
		queue.insert(idx, [pos, stam])
	
	
	func cmp_priority(elem, insert):
		# Check the priority
		if elem[1] < insert[1]: 
			return true
		elif elem[1] > insert[1]:
			return false
		else:
			if elem[0].y < insert[0].y:
				return true
			elif elem[0].y > insert[0].y:
				return false
			else:
				if elem[0].x < insert[0].x:
					return true
				else:
					return false
	
	
	func dequeue():
		var pos = queue.pop_back()[0]
		var data = node_data[pos]
		return {"pos": pos, "dir": data.dir, "stam": data.stam}
