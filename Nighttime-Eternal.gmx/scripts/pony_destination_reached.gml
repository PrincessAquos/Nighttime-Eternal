///pony_destination_reached(pony)
var pony = argument[0];

with (pony) {
    stamina = path.stamina
    move_path_clear(path);
    scr_traverse_moves_new(id, noone, 0, "destroy", 0);
    moving = false;
    destination = noone;
    moveMap = create_move_map(x, y, id);
    scr_traverse_moves_new(id, noone, 0, "make_visible", 0);
}
with (pony.path) instance_destroy();
with (pony) path = noone;
with (global.cursor) {
    //clickedChar = noone;
    movePath = noone;
}
global.cursor.menu = create_menu_character_action(pony);
