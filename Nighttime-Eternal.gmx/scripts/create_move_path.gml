///create_move_path(argX, argY, argPony)

var argX = argument[0];
var argY = argument[1];
var argPony = argument[2];

var movePath = instance_create(argX, argY, obj_path);
with (movePath) {
    pony = argPony;
    stamina = argPony.stamina;
    head = noone;
    tail = noone;
    visible = false;
}

return movePath
