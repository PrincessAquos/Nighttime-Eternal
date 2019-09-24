///draw_pony_wings(pony)
var pony = argument[0];

var body = pony.identity[? "body"]
var bodyPalette = body[? "palette"];

draw_sprite_ext(spr_wing_outline, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 2), 1);
draw_sprite_ext(spr_wing_fill, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
