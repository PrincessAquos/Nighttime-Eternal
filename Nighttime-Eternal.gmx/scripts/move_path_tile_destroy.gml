///move_path_tile_destroy(pathTile)

var pathTile = argument[0];

if (pathTile.prev != noone) {
    move_path_tile_destroy(pathTile.prev)
}

with (pathTile) instance_destroy();
