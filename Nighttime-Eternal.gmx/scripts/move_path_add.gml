///move_path_add(path, argNode)
var path = argument[0];
var argNode = argument[1];

newPathTile = create_move_path_tile(argNode.x, argNode.y, argNode, path, path.head)
move_path_tile_update(newPathTile)

if (path.head != noone) {
    path.head.next = newPathTile
    move_path_tile_update(newPathTile.prev)
}
else path.tail = newPathTile
path.stamina -= argNode.tile.stamCost
path.head = newPathTile
return newPathTile
