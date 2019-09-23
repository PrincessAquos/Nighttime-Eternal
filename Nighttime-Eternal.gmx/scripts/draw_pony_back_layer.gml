///draw_pony_back_layer(pony, moving)
var pony = argument[0];
var moving = argument[1];

var body = pony.identity["body"]
var bodyPalette = body["palette"]

if (!moving) {
    draw_sprite_ext(spr_farleg_outline, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(pony.identity.bodyPalette, 2), 1);
    draw_sprite_ext(spr_farleg_fill, 0, pony.x, pony.y, 1, 1, 0, palette_get_color(pony.identity.bodyPalette, 3), 1);
}
else {
    draw_sprite_ext(spr_run_farleg_outline, pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(pony.identity.bodyPalette, 2), 1);
    draw_sprite_ext(spr_run_farleg_fill, pony.moveSpriteIndex, pony.x, pony.y, 1, 1, 0, palette_get_color(pony.identity.bodyPalette, 3), 1);
    //draw_text(pony.x, pony.y + 32, string(moveSpriteIndex))
}
