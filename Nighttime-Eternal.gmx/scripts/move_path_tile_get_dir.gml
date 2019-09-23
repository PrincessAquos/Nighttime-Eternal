///move_path_tile_get_dir(path_tile)

var path_tile = argument[0];

var left = 0;
var right = 1;
var up = 2;
var down = 3;

if (path_tile.prev != noone) {
    if (path_tile.x < path_tile.prev.x) {
        return left;
    }
    else if (path_tile.x > path_tile.prev.x) {
        return right;
    }
    else if (path_tile.y < path_tile.prev.y) {
        return up;
    }
    else if (path_tile.y > path_tile.prev.y) {
        return down;
    }
}
else {
    if (path_tile.x < path_tile.path.x) {
        return left;
    }
    else if (path_tile.x > path_tile.path.x) {
        return right;
    }
    else if (path_tile.y < path_tile.path.y) {
        return up;
    }
    else if (path_tile.y > path_tile.path.y) {
        return down;
    }
}
