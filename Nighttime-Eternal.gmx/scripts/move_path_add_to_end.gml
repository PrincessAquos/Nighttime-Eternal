///move_path_add_to_end(path, argNode, argPathTileOptional)

var path = argument[0];
var argNode = argument[1];
var argPathTileOptional = argument[2];

if (path.head == noone) {
    return move_path_add(path, argNode)
}
else {
    var pathTile = argPathTileOptional;
    if (pathTile == noone) {
        pathTile = move_path_get_head(path)
        
        while (pathTile.prev != noone) {
            pathTile = pathTile.prev
        }
    }
    pathTile.prev = create_move_path_tile(argNode.x, argNode.y, argNode, path, noone)
    pathTile.prev.next = pathTile
    path.tail = pathTile.prev
    path.stamina -= argNode.tile.stamCost
    return pathTile.prev
}


