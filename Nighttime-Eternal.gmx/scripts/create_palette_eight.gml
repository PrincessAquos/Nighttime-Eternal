///create_palette_eight(color0, color1, color2, color3, color4, color5, color6, color7)
var color0 = argument[0];
var color1 = argument[1];
var color2 = argument[2];
var color3 = argument[3];
var color4 = argument[4];
var color5 = argument[5];
var color6 = argument[6];
var color7 = argument[7];

var palette = ds_list_create();
ds_list_add(palette, color0);
ds_list_add(palette, color1);
ds_list_add(palette, color2);
ds_list_add(palette, color3);
ds_list_add(palette, color4);
ds_list_add(palette, color5);
ds_list_add(palette, color6);
ds_list_add(palette, color7);

return palette;
