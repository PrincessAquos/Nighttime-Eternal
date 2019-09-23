///move_path_node_is_valid(path, argNode)
var path = argument[0];
var argNode = argument[1];

if (path == noone || move_path_is_empty(path)) {
    if (argNode.pony.stamina - argNode.tile.stamCost < 0) return false;
    return (argNode.pony.moveMap.left == argNode || argNode.pony.moveMap.right == argNode || argNode.pony.moveMap.up == argNode || argNode.pony.moveMap.down == argNode);
}
else {
    if (!move_path_node_is_adjacent(path, argNode)) return false;
    if (path.stamina - argNode.tile.stamCost < 0) return false;
    /* Loop through all path tiles, comparing argNode to their nodes */
    /*var tempPathTile = path.head;
    while (tempPathTile != noone) {
        if (argNode == tempPathTile.node) return false;
        tempPathTile = tempPathTile.prev;
    }*/
}

return true;
