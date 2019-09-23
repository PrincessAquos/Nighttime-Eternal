///scr_traverse_moves(inst, function, ext_int)

var inst = argument[0];
var function = argument[1];
var ext_int = argument[2];

for (var i = 0; i < instance_count; i += 1;) {
    node = instance_id[i]
    if (object_get_name(node.object_index) == "obj_move_node") {
        if (node.pony == inst) {
            if (function == "make_visible") {
                with(node) visible = true;
            }
            if (function == "make_invisible") {
                with(node) visible = false;
            }
            if (function == "incr_sprite_index_by") {
                with(node) image_index += ext_int;
            }
            if (function == "destroy") {
                with(node) instance_destroy();
            }
        }
    }
    else if (object_get_name(node.object_index) == "obj_move_map") {
        if (node.pony == inst) {
            if (function == "destroy") {
                with(node) instance_destroy();
            }
        }
    }
}

/*
if (node != noone) {
    //recursive calls
    if (dir != 1) {
        scr_traverse_moves(inst, function, head, node.right, 1);
    }
    if (dir != 2) {
        scr_traverse_moves(inst, function, head, node.left, 2);
    }
    if (dir != 3) {
        scr_traverse_moves(inst, function, head, node.left, 3);
    }
    if (dir != 4) {
        scr_traverse_moves(inst, function, head, node.left, 4);
    }
}
if (dir = 0) {
*/
