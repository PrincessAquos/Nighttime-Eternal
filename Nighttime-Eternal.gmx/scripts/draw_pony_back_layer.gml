///draw_pony_back_layer(pony, moving)
var pony = argument[0];
var moving = argument[1];

var body = pony.identity[? "body"]
var bodyPalette = body[? "palette"]
var bodyModel = body[? "model"]

if (!moving) {
    draw_sprite_ext(asset_get_index("spr_farleg_" + bodyModel + "_outline"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 2), 1);
    draw_sprite_ext(asset_get_index("spr_farleg_" + bodyModel + "_fill"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 3), 1);
}
else {
    draw_sprite_ext(asset_get_index("spr_run_farleg_" + bodyModel + "_outline"), pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 2), 1);
    draw_sprite_ext(asset_get_index("spr_run_farleg_" + bodyModel + "_fill"), pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 3), 1);
    //draw_text(pony.x, pony.y + 32, string(moveSpriteIndex))
}
