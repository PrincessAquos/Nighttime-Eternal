///scr_traverse_moves_new(argPony, argNode, argDir, function, ext_int)

var argPony = argument[0];
var argNode = argument[1];
var argDir = argument[2];
var function = argument[3];
var ext_int = argument[4];

if (argDir == 0) {
    argNode = argPony.moveMap
    scr_traverse_moves_new(argPony, argNode.right, 1, function, ext_int);
    scr_traverse_moves_new(argPony, argNode.left, -1, function, ext_int);
    scr_traverse_moves_new(argPony, argNode.up, -2, function, ext_int);
    scr_traverse_moves_new(argPony, argNode.down, 2, function, ext_int);
    if (function == "destroy") {
        with(argNode) destroy = true;
    }
}
else {
    if (argNode == noone || argNode.head) {
        return noone;
    }
    else if (function != "untag") { 
        if (argNode.tag != true) {
            with(argNode) tag = true;
            if (argDir != -1) scr_traverse_moves_new(argPony, argNode.right, 1, function, ext_int);
            if (argDir != 1) scr_traverse_moves_new(argPony, argNode.left, -1, function, ext_int);
            if (argDir != 2) scr_traverse_moves_new(argPony, argNode.up, -2, function, ext_int);
            if (argDir != -2) scr_traverse_moves_new(argPony, argNode.down, 2, function, ext_int);
            if (function == "make_visible") {
                with(argNode) visible = true;
            }
            if (function == "make_invisible") {
                with(argNode) visible = false;
            }
            if (function == "incr_sprite_index_by") {
                with(argNode) image_index += ext_int;
            }
            if (function == "destroy") {
                with(argNode) destroy = true;
            }
        }
    }
    else if (argNode.tag) {
        with(argNode) tag = false;
        if (argDir != -1) scr_traverse_moves_new(argPony, argNode.right, 1, "untag", ext_int);
        if (argDir != 1) scr_traverse_moves_new(argPony, argNode.left, -1, "untag", ext_int);
        if (argDir != 2) scr_traverse_moves_new(argPony, argNode.up, -2, "untag", ext_int);
        if (argDir != -2) scr_traverse_moves_new(argPony, argNode.down, 2, "untag", ext_int);
    }
}
if (argDir == 0 && function != "destroy") {
    scr_traverse_moves_new(argPony, argNode.right, 1, "untag", ext_int);
    scr_traverse_moves_new(argPony, argNode.left, -1, "untag", ext_int);
    scr_traverse_moves_new(argPony, argNode.up, -2, "untag", ext_int);
    scr_traverse_moves_new(argPony, argNode.down, 2, "untag", ext_int);
}
