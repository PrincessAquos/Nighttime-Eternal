///button_click(button)
var button = argument[0];

switch (button.function) {
    // Enter the move path plotting state
    case "move":
        scr_traverse_moves_new(global.cursor.clickedChar, noone, 0, "incr_sprite_index_by", 1);
        //scr_traverse_moves(cursor.clickedChar, "incr_sprite_index_by", 1);
        global.cursor.movePath = create_move_path(global.cursor.clickedChar.x, global.cursor.clickedChar.y, global.cursor.clickedChar);
        game_set_state("movement")
        break;
    // Close the menu
    case "close":
    default:
        game_set_state("selecting")
        global.cursor.clickedChar = noone;
}
with(global.cursor.menu) instance_destroy();
