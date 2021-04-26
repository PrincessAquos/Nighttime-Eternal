extends TileMap

class_name LevelMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_tile(coords:Vector2):
	var id = get_cellv(coords)
	var tilename
	
	if id != -1:
		tilename = tile_set.tile_get_name(id)
	else:
		tilename = "none"
		
	if tilename in tile_set.tile_data:
		return tile_set.tile_data[tilename]
	else:
		return {"name": "NULL", "wall_height": 2, "cost": 999}


func get_tile_world(world_coords:Vector2):
	return get_tile(world_to_map(world_coords))
