///cursor_select_pony(cursor, argX, argY)
// Handles which character is highlighted, and shows the preview of their movement
var cursor = argument[0];
var argX = argument[1];
var argY = argument[2];

var temp = instance_position(argX, argY, obj_Pony);

// If the current selection and previous selection don't match
if (temp != cursor.selectedChar) {
    // But also only if you haven't clicked a character
    if (cursor.clickedChar == noone) {
        // If some other character was highlighted before, hide their move map
        if (cursor.selectedChar != noone) {
            scr_traverse_moves_new(cursor.selectedChar, noone, 0, "make_invisible", 0);
        }
        // If you're highlighting a character now, show their move map
        if (temp != noone) {
            scr_traverse_moves_new(temp, noone, 0, "make_visible", 0);
        }
    }
    // Regardless, your selection has changed, so update your selection
    cursor.selectedChar = temp;
}


