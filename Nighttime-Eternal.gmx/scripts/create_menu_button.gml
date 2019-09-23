///create_menu_button(argX, argY, argWidth, argHeight, argFunction, argButtonNumber)
var argX = argument[0];
var argY = argument[1];
var argWidth = argument[2];
var argHeight = argument[3];
var argFunction = argument[4];
var argButtonNumber = argument[5];

var newButton = instance_create(argX, argY, obj_menu_button)
with (newButton) {
    width = argWidth;
    height = argHeight;
    function = argFunction;
    isHighlighted = false;
    buttonNumber = argButtonNumber
}

return newButton;
