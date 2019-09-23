///move_map_next_node(pQueue, prevNode, targetDir)
// If possible, creates and queues a new node in the given direction from the previous node
// Returns the node created.
// If not possible, returns noone.

var pQueue = argument[0];
var prevNode = argument[1];     // The previous node
var targetDir = argument[2];       // The direction to move from the previous node

var argX = prevNode.x;
var argY = prevNode.y;
var argPony = prevNode.pony;
var argStamina = prevNode.maxStam;

// Move the coordinates one tile in the given direction
switch(targetDir) {
    case -2:
        argY -= 32;
        break;
    case 2:
        argY += 32;
        break;
    case 1:
        argX += 32;
        break;
    case -1:
        argX -= 32;
        break;
    default:
        break;
}

// At this point, we shift perspectives.
// Code up until this point operated from the perspective of
// the node popped from the queue. Now we mostly shift perspective
// to the node that will be queued.
var moveTile = instance_position(argX, argY, obj_movetile);
var argStamina = get_remaining_stamina(moveTile, argPony, argStamina);
var oldStamina = 0;
// The direction for the path to trace back the most efficient path
var optimalDir = opposite_direction(targetDir);

var new_node = move_map_get_node(argX, argY, argPony);

if (new_node != noone) oldStamina = new_node.maxStam;

if (argStamina >= oldStamina) {
    if (new_node == noone) {
        new_node = create_move_node(argX, argY, argPony, argStamina, optimalDir, prevNode, moveTile);
    }
    else {
        update_move_node(new_node, argStamina, optimalDir, prevNode);
    }
    if (argStamina > oldStamina) {
        move_node_add_to_queue(pQueue, new_node);
    }
}
else {
    new_node = noone;
}

return new_node;
