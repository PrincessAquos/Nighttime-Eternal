///cursor_click(cursor)

var cursor = argument[0];

switch(global.game.state) {
    case "selecting":
        // If you're highlighting a character
        if (cursor.selectedChar != noone) {
            // Make it the new clicked character and open a menu
            cursor.clickedChar = cursor.selectedChar;
            cursor.menu = create_menu_character_action(clickedChar);
        }
        break;
    case "movement":
        // If you click the character you were moving
        if (cursor.selectedChar == cursor.clickedChar) {
            // Clear out the move path
            move_path_clear(cursor.movePath);

            // Fade out the move map to be a preview again
            scr_traverse_moves_new(cursor.clickedChar, noone, 0, "incr_sprite_index_by", -1);

            // Destroy the move path object, and reset references
            with (cursor.movePath) instance_destroy();
            cursor.movePath = noone;
            cursor.menu = create_menu_character_action(clickedChar);
        }
        // Otherwise, try to move
        else {
            var char = instance_position(cursor.x, cursor.y, obj_Pony);
            if (char == noone) {
                //Tries to get a node from the space
                var node = instance_position(cursor.x, cursor.y, obj_move_node);
                //Loops through nodes in the same location
                while (node != noone) && (node.pony != cursor.clickedChar) {
                    //Deactivates nodes in the way
                    instance_deactivate_object(node);
                    //Gets the next node in the location
                    node = instance_position(cursor.x, cursor.y, obj_move_node);
                }
                instance_activate_object(obj_move_node); //REACTIVATES ALL MOVE NODES.
                if (node != noone) {
                    if (node.pony == cursor.clickedChar) {
                        game_set_state("animating")
                        //scr_traverse_moves(cursor.clickedChar, "destroy", 0);
                        cursor.clickedChar.path = cursor.movePath
                        cursor.clickedChar.moving = true;
                        //cursor.clickedChar = noone;
                    }
                }
            }
        }
        break;
    case "menu":
    case "action":
    default:
        break;
}
