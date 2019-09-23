///create_pony_mane(argX, argY, argPalette, argStyle)
var argX = argument[0];
var argY = argument[1];
var argPalette = argument[2];
var argStyle = argument[3];

var mane = instance_create(argX, argY, obj_pony_mane);
with (mane) {
    palette = argPalette
    style = argStyle
}

return mane;
