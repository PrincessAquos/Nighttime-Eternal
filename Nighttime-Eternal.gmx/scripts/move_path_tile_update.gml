///move_path_tile_update(path_tile)
// This function determines which path subimage should display, based on 
// the direction of travel of the previous path tile and the current.
var path_tile = argument[0];

with (path_tile) {
    
    if (next == noone) {
        image_index = dir;
    }
    else {
        var dir1 = 0
        var dir2 = 0
        
        // Convert the direction format
        // The path tiles currently have a format where
        //      left = 0
        //      right = 1
        //      up = 2
        //      down = 3
        // This is actually something I plan to change to make it more
        // consistent with move maps. 
        // I was very obsessed with the idea of it being disgustingly simple 
        // for the final node, the one with the arrow, to figure out which image
        // to use. However, it has made the code kinda confusing.
        switch (dir) {
            // Make left -1, which indicates a negative in the x direction
            case 0:
                dir1 = -1
                break;
            case 1:
                dir1 = 1
                break;
            case 2:
                dir1 = -2
                break;
            case 3:
                dir1 = 2
                break;
        }
        switch (next.dir) {
            case 0:
                dir2 = -1
                break;
            case 1:
                dir2 = 1
                break;
            case 2:
                dir2 = -2
                break;
            case 3:
                dir2 = 2
                break;
        }
//Crazy math wizardry
/*
left = -1
right = 1
up = -2
down = 2

|_
left - up = 1
down - right = 1
_
 |
up - left = -1
right - down = -1
 _
|
left - down = -3
up - right = -3

_|
down - left = 3
right - up = 3

Why use a mess of if/then statements, when you can just
use a confusing math calculation?
*drops keyboard*
That was supposed to be like dropping the mic, since,
you know, I'm typing this and not speaking it, but it
kinda just comes off like I'm a klutz. The programmer
is Derpy Hooves confirmed.
*/
                
        //make the other sprites happen
        switch (dir1 - dir2) {
            // A "0" indicates no turn
            case 0:
                // This is where "1 means horizonal, 2 means vertical" comes in handy
                if (abs(dir1) == 1) image_index = 8
                else if (abs(dir1) == 2) image_index = 9
                else image_index = 10
                break;
            case 1:
                image_index = 7;
                break;
            case -1:
                image_index = 4;
                break;
            case 3:
                image_index = 6;
                break;
            case -3:
                image_index = 5;
                break;
            default:
                image_index = 10;
        }
    }
}
