extends Reference

class_name LevelHelper

const DEFAULT_ROOT = "/root/Stage"

static func get_level_map(any_node:Node, path_to_root:String = DEFAULT_ROOT):
	return any_node.get_node(path_to_root + "/Level/TileMap")


static func get_characters(any_node:Node, path_to_root:String = DEFAULT_ROOT):
	return any_node.get_node(path_to_root + "/Characters")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
