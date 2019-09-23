///create_pony_tail(argX, argY, argColors, argStyle);
var argX = argument[0];
var argY = argument[1];
var argPalette = argument[2];
var argStyle = argument[3];

var tail = instance_create(argX, argY, obj_pony_tail);
with (tail) {
    palette = argPalette
    style = argStyle
}

return tail;
