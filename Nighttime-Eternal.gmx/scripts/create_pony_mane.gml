///create_pony_mane(argX, argY, argPalette, argStyle)
var argX = argument[0];
var argY = argument[1];
var argPalette = argument[2];
var argModel = argument[3];

var mane = ds_map_create();
ds_map_add(mane, "model", argModel);
ds_map_add(mane, "palette", argPalette);

return mane;
