///draw_pony_wings(pony)
var pony = argument[0];

var body = pony.identity[? "body"]
var bodyPalette = body[? "palette"];
var bodyModel = body[? "model"];

draw_sprite_ext(asset_get_index("spr_wing_" + bodyModel + "_outline"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 2), 1);
draw_sprite_ext(asset_get_index("spr_wing_" + bodyModel + "_fill"), 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
