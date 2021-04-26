# The object will free itself when there are no longer any references to it
extends Reference

class_name PQueue

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


func enqueue(pos:Vector2, data, stam:int):
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
	node_data[pos] = {"data": data, "stam": stam}
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
	return {"pos": pos, "stam": data.stam, "data": data.data}
