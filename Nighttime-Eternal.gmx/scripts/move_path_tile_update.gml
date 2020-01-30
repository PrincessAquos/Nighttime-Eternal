///move_path_tile_update(path_tile)
// This function determines which path subimage should display, based on 
// the direction of travel of the previous path tile and the current.
var path_tile = argument[0];

with (path_tile) {
    
    // If this is the tip of the path, then it should have an arrow image.
    if (next == noone) {
        switch(dir) {
            // Left Arrow
            case -1:
                image_index = 0
                break;
            // Right Arrow
            case 1:
                image_index = 1
                break;
            // Up Arrow
            case -2:
                image_index = 2
                break;
            // Down Arrow
            case 2:
                image_index = 3
                break;
        }
    }
    // Otherwise, figure out which path segment to use.
    else {
        /*
        Next, use the current node's direction and the next node's direction
        to calculate what kind of segment the node is. Since straight to the left and
        straight to the right would use the same path segment image, along with
        "left then up" sharing the same corner segment as "down then right," I devised
        an algorithm to figure out what the image should be.
        --------------------------
        *Crazy math wizardry time*
        --------------------------
        Using the power of subtraction and my specific way of representing directions,
        I can identify the different types of movements and group them accordingly.

        Just like with move maps, the directions are:
        left = -1
        right = 1
        up = -2
        down = 2
        */
        switch (dir - next.dir) {
            /*
            If both path tiles are moving in the same direction, the subtraction results
            in a 0. So 0 indicates no turn.
            */
            case 0:
                // The absolute value of either tile's direction then indicates
                // horizontal or vertical, with values of 1 and 2 respectively.
                if (abs(dir) == 1) image_index = 8
                else if (abs(dir) == 2) image_index = 9
                // Otherwise, set to the panic image index, which draws no path segment
                else image_index = 10
                break;

            // Lower left corner
            // |_
            // left - up = 1
            // down - right = 1
            case 1:
                image_index = 7;
                break;

            // Upper right corner
            // _
            //  |
            // up - left = -1
            // right - down = -1
            case -1:
                image_index = 4;
                break;

            // Upper left corner
            //  _
            // |
            // left - down = -3
            // up - right = -3
            case 3:
                image_index = 6;
                break;

            // Lower right corner
            // _|
            // down - left = 3
            // right - up = 3
            case -3:
                image_index = 5;
                break;

            // This is the panic option. This draws no path segment.
            default:
                image_index = 10;

            /*
            Why use a mess of if/then statements, when you can just
            use a weird system of numbers?

            *drops keyboard*

            That was supposed to be like dropping the mic, since,
            you know, I'm typing this and not speaking it, but it
            kinda just comes off like I'm a klutz. The programmer
            is Derpy Hooves confirmed.
            */
        }
    }
}
