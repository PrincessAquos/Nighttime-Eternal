///cursor_click(cursor)

var cursor = argument[0];

/* Update the clicked character */
if (cursor.selectedChar != noone) {
    if (cursor.clickedChar == noone) {
        /*
        cursor.isPaused = true;
        var functions = ds_list_create()
        ds_list_add(functions, "move", "attack", "stats", "cancel");
        cursor.menu = create_menu_mini(cursor.x + global.gridSize, cursor.y, functions);
        */
        cursor.clickedChar = cursor.selectedChar;
        cursor.menu = create_menu_character_action(clickedChar);
        /*
        scr_traverse_moves_new(cursor.clickedChar, noone, 0, "incr_sprite_index_by", 1);
        //scr_traverse_moves(cursor.clickedChar, "incr_sprite_index_by", 1);
        cursor.movePath = create_move_path(clickedChar.x, clickedChar.y, clickedChar);
        */
    }
    else if (cursor.clickedChar == cursor.selectedChar) {
        move_path_clear(cursor.movePath);
        //scr_traverse_moves(cursor.clickedChar, "make_visible", 0);
        scr_traverse_moves_new(cursor.clickedChar, noone, 0, "incr_sprite_index_by", -1);
        //scr_traverse_moves(cursor.clickedChar, "incr_sprite_index_by", -1);
        with (cursor.movePath) instance_destroy();
        cursor.movePath = noone;
        cursor.clickedChar = noone;
    }
}
else if (cursor.clickedChar != noone) {
    //Tries to get a node from the space
    var node = instance_position(x, y, obj_move_node);
    //Loops through nodes in the same location
    while (node != noone) && (node.pony != cursor.clickedChar) {
        //Deactivates nodes in the way
        instance_deactivate_object(node);
        //Gets the next node in the location
        node = instance_position(x, y, obj_move_node);
    }
    instance_activate_object(obj_move_node); //REACTIVATES ALL MOVE NODES.
    if (node != noone) {
        if (node.pony == cursor.clickedChar) {
            //scr_traverse_moves(cursor.clickedChar, "destroy", 0);
            cursor.isPaused = true;
            cursor.clickedChar.path = cursor.movePath
            cursor.clickedChar.moving = true;
            //cursor.clickedChar = noone;
        }
    }
}
