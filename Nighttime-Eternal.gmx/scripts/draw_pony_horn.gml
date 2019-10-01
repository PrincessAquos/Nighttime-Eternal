///draw_pony_horn(pony, headX, headY)
var pony = argument[0];
var headX = argument[1];
var headY = argument[2];

var body = pony.identity[? "body"];
var bodyPalette = body[? "palette"];
var bodyModel = body[? "model"];

draw_sprite_ext(asset_get_index("spr_horn_" + bodyModel + "_outline"), 0, headX, headY, 1, 1, 0, palette_get_color(bodyPalette, 0), 1);
draw_sprite_ext(asset_get_index("spr_horn_" + bodyModel + "_fill"), 0, headX, headY, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
