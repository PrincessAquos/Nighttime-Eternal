///move_path_delete_head(path)
var path = argument[0];

tempPathTile = path.head.prev;
if (tempPathTile != noone) tempPathTile.next = noone;
path.stamina += path.head.node.tile.stamCost;
with (path.head) instance_destroy();
path.head = tempPathTile;
move_path_tile_update(tempPathTile);
