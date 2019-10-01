///draw_pony_front_layer(pony, moving)
var pony = argument[0];
var moving = argument[1];

var body = pony.identity[? "body"]
var bodyPalette = body[? "palette"];
var bodyModel = body[? "model"]

if (!moving) {
    draw_sprite_ext(asset_get_index("spr_body_" + bodyModel + "_outline"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 0), 1);
    draw_sprite_ext(asset_get_index("spr_body_" + bodyModel + "_fill"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
}
else {
    draw_sprite_ext(asset_get_index("spr_run_body_" + bodyModel + "_outline"), pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 0), 1);
    draw_sprite_ext(asset_get_index("spr_run_body_" + bodyModel + "_fill"), pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
}
