///palette_add_color(palette, color)
var palette = argument[0];
var color = argument[1];

var length = palette_length(palette);

palette[| length] = color;
