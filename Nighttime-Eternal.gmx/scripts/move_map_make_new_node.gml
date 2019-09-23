///move_map_make_new_node(move_map, argX, argY, argPony, argStamina, argDir)
var move_map = argument[0];
var argX = argument[1];
var argY = argument[2];
var argPony = argument[3];
var argStamina = argument[4];
var argDir = argument[5];

var newStamina = argStamina;
var moveTile = instance_position(argX, argY, obj_movetile);
if (moveTile != noone) {
    newStamina -= moveTile.stamCost
}
var newMoveNode = move_map_preexisting_node(move_map, argX, argY, argPony, newStamina, argDir);
if (newMoveNode == noone) {
    if (moveTile != noone && !moveTile.isWall && moveTile.stamCost <= argStamina) {
        newMoveNode = create_move_node_old(argX, argY, argPony, newStamina, argDir, move_map, moveTile);
    }
}
return newMoveNode;
