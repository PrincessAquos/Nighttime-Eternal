///get_direction(dir_string)
dir_string = argument[0];

switch(dir_string){
    case "LEFT":
    case "FROMRIGHT":
        return -1;
    case "RIGHT":
    case "FROMLEFT":
        return 1;
    case "UP":
    case "FROMDOWN":
        return -2;
    case "DOWN":
    case "FROMUP":
        return 2;
    case "ORIGIN":
        return 0;
    default:
        return 3;
}
