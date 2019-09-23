///create_move_map(argX, argY, argPony)
var argX = argument[0];
var argY = argument[1];
var argPony = argument[2];

var newMoveMap = instance_create(argX, argY, obj_move_map);
with (newMoveMap) {
    pony = argPony;
    maxStam = argPony.stamina;
    head = true;
    visible = false;
}
move_map_add_neighbors(newMoveMap, argX, argY, argPony, argPony.stamina, 0, noone);

return newMoveMap;
