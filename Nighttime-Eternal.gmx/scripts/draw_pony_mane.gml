///draw_pony_mane(mane, argHeadX, argHeadY, argRace)
var mane = argument[0];
var argHeadX = argument[1];
var argHeadY = argument[2];
var argRace = argument[3];

var tempsprite = -1
var model = mane["model"]
var palette = mane["palette"]

for(i = 0; i < palette_length(palette); i++) {
    if(argRace == "unicorn" || argRace == "alicorn") {
        tempsprite = asset_get_index("spr_mane_" + model + string(i) + "_unicorn");
    }
    if(tempsprite <= -1) {
        tempsprite = asset_get_index("spr_mane_" + model + string(i));
    }
    if(tempsprite > -1) {
        draw_sprite_ext(tempsprite, 0, argHeadX, argHeadY, 1, 1, 0, palette_get_color(palette, i), 1);
    }
    tempsprite = -1;
}
