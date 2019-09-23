///cursor_select_pony(cursor, argX, argY)
var cursor = argument[0];
var argX = argument[1];
var argY = argument[2];

var temp = instance_position(argX, argY, obj_Pony);

if (temp != cursor.selectedChar) {
    if (cursor.clickedChar == noone) {
        if (cursor.selectedChar != noone) {
            scr_traverse_moves_new(cursor.selectedChar, noone, 0, "make_invisible", 0);
            //scr_traverse_moves(cursor.selectedChar, "make_invisible", 0);
        }
        if (temp != noone) {
            scr_traverse_moves_new(temp, noone, 0, "make_visible", 0);
            //scr_traverse_moves(temp, "make_visible", 0);
        }
    }
    cursor.selectedChar = temp;
}


