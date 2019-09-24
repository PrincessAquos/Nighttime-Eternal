///draw_pony_eyes(pony, headX, headY)
var pony = argument[0];
var headX = argument[1];
var headY = argument[2];

var body = pony.identity[? "body"]
var bodyPalette = body[? "palette"];

draw_sprite_ext(spr_eye_top, 0, headX, headY, 1, 1, 0, palette_get_color(bodyPalette, 4), 1);
draw_sprite_ext(spr_eye_bottom, 0, headX, headY, 1, 1, 0, palette_get_color(bodyPalette, 5), 1);
