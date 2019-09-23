///pony_move(pony, argPath)

var pony = argument[0];
var argPath = argument[1];

var spd = global.moveSpeed

if (pony.destination == noone) {
    with (pony) destination = move_path_get_tail(argPath)
}

if (pony.x == pony.destination.x && pony.y == pony.destination.y) {
    if (pony.destination.next != noone) {
        pony.destination = pony.destination.next;
    }
    else {
        pony_destination_reached(pony);        
    }
}
if (destination != noone) {
    if (pony.x < pony.destination.x) {
        pony.x += spd;
    }
    else if (pony.x > pony.destination.x) {
        pony.x -= spd;
    }
    if (pony.y < pony.destination.y) {
        pony.y += spd;
    }
    else if (pony.y > pony.destination.y) {
        pony.y -= spd;
    }
}

