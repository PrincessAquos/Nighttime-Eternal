///move_path_tile_get_dir(path_tile)

var path_tile = argument[0];

var left = -1;
var right = 1;
var up = -2;
var down = 2;

// If there's a path tile before this one, store that one
if (path_tile.prev != noone) {
    var previous = path_tile.prev
}
// Otherwise, store the source of the path itself
else {
    var previous = path_tile.path
}

// Compare the position of the path tile to the previous tile
if (path_tile.x < previous.x) {
    return left;
}
else if (path_tile.x > previous.x) {
    return right;
}
else if (path_tile.y < previous.y) {
    return up;
}
else if (path_tile.y > previous.y) {
    return down;
}
