///draw_pony_tail(tail, argX, argY)
var tail = argument[0];
var argX = argument[1];
var argY = argument[2];

var tempsprite = -1
var palette = tail["palette"]
var model = tail["model"]
for(i = 0; i < palette_length(palette); i++) {
    tempsprite = asset_get_index("spr_tail_" + model + string(i));
    if(tempsprite > -1) {
        draw_sprite_ext(tempsprite, 0, argX, argY, 1, 1, 0, palette_get_color(palette, i), 1);
    }
}
