///move_path_node_retread(path, argNode)
var path = argument[0];
var argNode = argument[1];

var tempPathTile = path.head;
if (tempPathTile != noone) {
    while (tempPathTile != noone) {
        if (argNode == tempPathTile.node) break;
        tempPathTile = tempPathTile.prev;
    }
}
return tempPathTile;
