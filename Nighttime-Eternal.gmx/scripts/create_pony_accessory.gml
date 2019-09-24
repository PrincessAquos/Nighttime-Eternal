///create_pony_accessory(argX, argY, argColors, argStyle, argIsOnHead)
var argX = argument[0];
var argY = argument[1];
var argUseCustomColors = argument[2];
var argPalette = argument[3];
var argModel = argument[4];
var argIsOnHead = argument[5];

var accessory = ds_map_create();
ds_map_add(accessory, "model", argModel);
ds_map_add(accessory, "useCustomColors", argUseCustomColors);
ds_map_add(accessory, "palette", argPalette);
ds_map_add(accessory, "isOnHead", argIsOnHead);

return accessory;
