///opposite_direction(dir)
var dir = argument[0];

switch(dir) {
    case -1:
        return get_direction("RIGHT");
        
    case 1:
        return get_direction("LEFT");
        
    case -2:
        return get_direction("DOWN");

    case 2:
        return get_direction("UP");

    default:
        return dir;
}
