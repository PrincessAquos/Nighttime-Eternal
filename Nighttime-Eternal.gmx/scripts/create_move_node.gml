///create_move_node(argX, argY, argPony, argStamina, argOptimalDir, argPrevious, argMoveTile, pQueue)
// Creates a new move node, and then updates it, where it's added to the priority queue 
var argX = argument[0];
var argY = argument[1];
var argPony = argument[2];
var argStamina = argument[3];
var argOptimalDir = argument[4];
var argPrevious = argument[5];
var argMoveTile = argument[6];
var pQueue = argument[7];

var newMoveNode = instance_create(argX, argY, obj_move_node);
with (newMoveNode) {
    pony = argPony;
    head = false;
    visible = false;
    tile = argMoveTile;
    left = noone;
    right = noone;
    up = noone;
    down = noone;
}

update_move_node(newMoveNode, argStamina, argOptimalDir, argPrevious, pQueue);

// old way of doing things
//move_map_update(newMoveNode, argX, argY, argPony, argStamina, argDir, argPrevious);

return newMoveNode;
