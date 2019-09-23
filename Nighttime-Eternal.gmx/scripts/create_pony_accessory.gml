///create_pony_accessory(argX, argY, argColors, argStyle, argIsOnHead)
var argX = argument[0];
var argY = argument[1];
var argUseCustomColors = argument[2];
var argPalette = argument[3];
var argStyle = argument[4];

var attribute = instance_create(argX, argY, obj_pony_accessory);
with (attribute) {
    useCustomColors = argUseCustomColors
    palette = argPalette
    style = argStyle
    isOnHead = true
}

return attribute;
