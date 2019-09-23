///pony_get_head_x(argX, animFrame, argMoving)
var argX = argument[0];
var animFrame = argument[1];
var argMoving = argument[2];

var headX = argX;
if (argMoving) {
    switch (animFrame) {
        case 0:
        case 7:
            break;
        case 1:
        case 6:
            headX -= 1;
            break;
        case 2:
        case 3:
        case 5:
            headX -= 2;
            break;
        case 4:
            headX -= 3;
            break;
    }
}

return headX;
