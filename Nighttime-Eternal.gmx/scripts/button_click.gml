///button_click(button)
var button = argument[0];

switch (button.function) {
    case "move":
        scr_traverse_moves_new(global.cursor.clickedChar, noone, 0, "incr_sprite_index_by", 1);
        //scr_traverse_moves(cursor.clickedChar, "incr_sprite_index_by", 1);
        global.cursor.movePath = create_move_path(global.cursor.clickedChar.x, global.cursor.clickedChar.y, global.cursor.clickedChar);
        break;
    case "cancel":
        global.cursor.clickedChar = noone;
        break;
    default:
        global.cursor.clickedChar = noone;
}
global.cursor.isPaused = false;
with(global.cursor.menu) instance_destroy();
