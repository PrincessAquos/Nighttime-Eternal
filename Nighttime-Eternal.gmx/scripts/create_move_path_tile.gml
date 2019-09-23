///create_move_path_tile(argX, argY, argNode, argPath, argPrev)

var argX = argument[0];
var argY = argument[1];
var argNode = argument[2];
var argPath = argument[3];
var argPrev = argument[4];

var path_tile = instance_create(argX, argY, obj_path_tile);
with (path_tile) {
    node = argNode
    path = argPath
    prev = argPrev
    next = noone
    dir = move_path_tile_get_dir(id)
    image_speed = 0;
}

return path_tile;
