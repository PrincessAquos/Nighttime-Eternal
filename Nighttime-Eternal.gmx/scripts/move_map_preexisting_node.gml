///move_map_preexisting_node(move_map, argX, argY, argPony, argNewStamina, argDir)
var move_map = argument[0];
var argX = argument[1];
var argY = argument[2];
var argPony = argument[3];
var argNewStamina = argument[4];
var argDir = argument[5];

var node = move_map_get_node(argX, argY, argPony);
if (node != noone) {
    if (!node.head && node.maxStam < argNewStamina) {
        move_map_update(node, argX, argY, argPony, argNewStamina, argDir, move_map);
    }
}
return node;
