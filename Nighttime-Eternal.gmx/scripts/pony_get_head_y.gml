///pony_get_head_y(argY, animFrame, argMoving)
var argY = argument[0];
var animFrame = argument[1];
var argMoving = argument[2];

var headY = argY;
if (argMoving) {
    if (animFrame >= 3) {
        headY += 1;
    }
    /*
    switch (animFrame) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
            headY += 1;
            break;
    }
    */
}

return headY;
