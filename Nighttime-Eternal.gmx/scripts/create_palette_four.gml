///create_palette_four(color0, color1, color2, color3)
var color0 = argument[0];
var color1 = argument[1];
var color2 = argument[2];
var color3 = argument[3];

var palette = instance_create(0, 0, obj_palette);
with (palette) {
    colors[0] = color0;
    colors[1] = color1;
    colors[2] = color2;
    colors[3] = color3;
}

return palette;
