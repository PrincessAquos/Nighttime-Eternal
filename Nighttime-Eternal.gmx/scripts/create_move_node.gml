///create_move_node(argX, argY, argPony, argStamina, argOptimalDir, argPrevious, argMoveTile)
var argX = argument[0];
var argY = argument[1];
var argPony = argument[2];
var argStamina = argument[3];
var argOptimalDir = argument[4];
var argPrevious = argument[5];
var argMoveTile = argument[6];

var newMoveNode = instance_create(argX, argY, obj_move_node);
with (newMoveNode) {
    pony = argPony;
    head = false;
    visible = true;
    tile = argMoveTile;
    left = noone;
    right = noone;
    up = noone;
    down = noone;
}

update_move_node(newMoveNode, argStamina, argOptimalDir, argPrevious);

// old way of doing things
//move_map_update(newMoveNode, argX, argY, argPony, argStamina, argDir, argPrevious);

return newMoveNode;