///move_map_add_neighbors(move_map, argX, argY, argPony, argStamina, argDir, argPrevious)

var move_map = argument[0];
var argX = argument[1];
var argY = argument[2];
var argPony = argument[3];
var argStamina = argument[4];
var argDir = argument[5];
var argPrevious = argument[6];


if (argDir != -1) move_map.right = move_map_make_new_node(move_map, argX + 32, argY, argPony, argStamina, 1);
else move_map.right = argPrevious;
if (argDir != 1) move_map.left = move_map_make_new_node(move_map, argX - 32, argY, argPony, argStamina, -1);
else move_map.left = argPrevious;
if (argDir != 2) move_map.up = move_map_make_new_node(move_map, argX, argY - 32, argPony, argStamina, -2);
else move_map.up = argPrevious;
if (argDir != -2) move_map.down = move_map_make_new_node(move_map, argX, argY + 32, argPony, argStamina, 2);
else move_map.down = argPrevious;
