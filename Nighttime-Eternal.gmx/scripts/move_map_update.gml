///move_map_update(move_map, argX, argY, argPony, argStamina, argDir, argPrevious)
var move_map = argument[0];
var argX = argument[1];
var argY = argument[2];
var argPony = argument[3];
var argStamina = argument[4];
var argDir = argument[5];
var argPrevious = argument[6];

with (move_map) {
    maxStam = argStamina;
    optimalDir = argDir * -1;
}

move_map_add_neighbors(move_map, argX, argY, argPony, argStamina, argDir, argPrevious);
