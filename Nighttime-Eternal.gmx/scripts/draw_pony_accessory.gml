///draw_pony_accessory(accessory, argX, argY, argRace)
var accessory = argument[0];
var argX = argument[1];
var argY = argument[2];
var argRace = argument[3];

var model = accessory["model"]

var tempsprite = -1;
if (!accessory.useCustomColors) {
    if (race == "alicorn") {
        tempsprite = asset_get_index("spr_accessory_" + model + "_alicorn");
    }
    if ((race == "pegasus" || race == "alicorn") && tempsprite <= -1) {
        tempsprite = asset_get_index("spr_accessory_" + model + "_pegasus");
    }
    if ((race == "unicorn" || race == "alicorn") && tempsprite <= -1) {
        tempsprite = asset_get_index("spr_accessory_" + model + "_unicorn");
    }
    if (tempsprite <= -1) {
        tempsprite = asset_get_index("spr_accessory_" + model);
    }
    if (tempsprite > -1) {
        draw_sprite(tempsprite, 0, argX, argY)
    }
}
