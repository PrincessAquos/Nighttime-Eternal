# The object will free itself when there are no longer any references to it
extends Reference

class_name Queue

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
	
	# This is either a new tile, or a more efficient path
	# Update node data and add to queue
	node_data[pos] = {"data": data, "stam": stam}
	# Find a spot to insert it
	queue.append([pos, stam])


func dequeue():
	var pos = queue.pop_back()[0]
	var data = node_data[pos]
	return {"pos": pos, "stam": data.stam, "data": data.data}
