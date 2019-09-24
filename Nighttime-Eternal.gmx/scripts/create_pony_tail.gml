///create_pony_tail(argX, argY, argColors, argStyle);
var argX = argument[0];
var argY = argument[1];
var argPalette = argument[2];
var argModel = argument[3];

var tail = ds_map_create();
ds_map_add(tail, "model", argModel);
ds_map_add(tail, "palette", argPalette);

return tail;
