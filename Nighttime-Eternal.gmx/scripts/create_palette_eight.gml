///create_palette_eight(color0, color1, color2, color3, color4, color5, color6, color7)
var color0 = argument[0];
var color1 = argument[1];
var color2 = argument[2];
var color3 = argument[3];
var color4 = argument[4];
var color5 = argument[5];
var color6 = argument[6];
var color7 = argument[7];

var palette = instance_create(0, 0, obj_palette);
with (palette) {
    colors[0] = color0;
    colors[1] = color1;
    colors[2] = color2;
    colors[3] = color3;
    colors[4] = color4;
    colors[5] = color5;
    colors[6] = color6;
    colors[7] = color7;
}

return palette;
