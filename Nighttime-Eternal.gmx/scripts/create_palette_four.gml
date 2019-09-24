///create_palette_four(color0, color1, color2, color3)
var color0 = argument[0];
var color1 = argument[1];
var color2 = argument[2];
var color3 = argument[3];

var palette = ds_list_create();
ds_list_add(palette, color0);
ds_list_add(palette, color1);
ds_list_add(palette, color2);
ds_list_add(palette, color3);

return palette;
