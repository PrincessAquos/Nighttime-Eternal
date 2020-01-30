///most_efficient_path(path, argNode, argPony)

var path = argument[0];
var argNode = argument[1];
var argPony = argument[2];

var stamina = argNode.pony.stamina

var tempNode = argNode;
var tempPathTile = noone;

while (tempNode.head != true) {
    tempPathTile = move_path_add_to_end(path, tempNode, tempPathTile);
    tempPathTile.dir = opposite_direction(tempNode.optimalDir)
    if (tempNode.optimalDir == -1) {
        tempNode = tempNode.left;
    }
    else if (tempNode.optimalDir == 1) {
        tempNode = tempNode.right;
    }
    else if (tempNode.optimalDir == -2) {
        tempNode = tempNode.up;
    }
    else if (tempNode.optimalDir == 2) {
        tempNode = tempNode.down;
    }
    move_path_tile_update(tempPathTile);
}

return path;
