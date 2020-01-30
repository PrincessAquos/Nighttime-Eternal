///create_menu_mini(argX, argY, argFunctions)
var argX = argument[0];
var argY = argument[1];
var argFunctions = argument[2];

//CONSTANTS
var buttonHeight = 32 //font size + 1 except no, not anymore
var buttonWidth = 112

var newMenuMini = instance_create(argX, argY, obj_menu_mini);
with(newMenuMini) {
    buttonList = ds_list_create();
    for (i = 0; i < ds_list_size(argFunctions); i++) {
        ds_list_add(buttonList, create_menu_button(argX, argY, buttonWidth, buttonHeight, argFunctions[| i], i))
    }
}
ds_list_destroy(argFunctions);
game_set_state("menu")

return newMenuMini;
