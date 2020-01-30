///create_menu_character_action(argPony)
var argPony = argument[0];

var functions = ds_list_create()
if (move_map_has_neighbors(argPony.moveMap)) {
    ds_list_add(functions, "move")
}
ds_list_add(functions, "attack", "stats", "close");
return create_menu_mini(argPony.x + global.gridSize, argPony.y, functions);
/*
scr_traverse_moves_new(cursor.clickedChar, noone, 0, "incr_sprite_index_by", 1);
//scr_traverse_moves(cursor.clickedChar, "incr_sprite_index_by", 1);
cursor.movePath = create_move_path(clickedChar.x, clickedChar.y, clickedChar);
*/
