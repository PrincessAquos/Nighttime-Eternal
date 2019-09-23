///draw_pony_front_layer(pony, moving)
var pony = argument[0];
var moving = argument[1];

var body = pony.identity["body"]
var bodyPalette = body["palette"];

if (!moving) {
    draw_sprite_ext(spr_body_outline, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 0), 1);
    draw_sprite_ext(spr_body_fill, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
}
else {
    draw_sprite_ext(spr_run_body_outline, pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 0), 1);
    draw_sprite_ext(spr_run_body_fill, pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(bodyPalette, 1), 1);
}
