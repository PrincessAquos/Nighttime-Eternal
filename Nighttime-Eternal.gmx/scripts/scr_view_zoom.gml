///scr_view_zoom(amount, view)
var zoomLevel = argument[0];
var view = argument[1];

var new_wview = view_wport[view]/zoomLevel;
var new_hview = view_hport[view]/zoomLevel;

// Limit how much they can zoom

// Get the offset
//var offx = new_wview - view_wview[view];
//var offy = new_hview - view_hview[view];

var ratioX = (mouse_x - view_xview[view])/view_wview[view];
var ratioY = (mouse_y - view_yview[view])/view_hview[view];

// Scale the view
view_wview[view] = new_wview;
view_hview[view] = new_hview;

// Adjust the view position based on the mouse position ratio

//view_xview[view] -= offx/2;
//view_yview[view] -= offy/2;

view_xview[view] = round(mouse_x-view_wview*ratioX);
view_yview[view] = round(mouse_y-view_hview*ratioY);
//view_yview[view] -= mouse_y/2;
