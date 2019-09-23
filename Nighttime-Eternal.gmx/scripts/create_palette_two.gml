///create_palette_two(color0, color1)
var color0 = argument[0];
var color1 = argument[1];

var palette = instance_create(0, 0, obj_palette);
with (palette) {
    colors[0] = color0;
    colors[1] = color1;
}

return palette;
