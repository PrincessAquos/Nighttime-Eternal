///create_palette_two(color0, color1)
var color0 = argument[0];
var color1 = argument[1];

var palette = ds_list_create();
ds_list_add(palette, color0);
ds_list_add(palette, color1);

return palette;
