///scr_build_move_map_PQBFS(argPony)
var argPony = argument[0];

var newMoveMap = instance_create(argPony.x, argPony.y, obj_move_map);
with (newMoveMap) {
    pony = argPony;
    maxStam = argPony.stamina;
    head = true;
    visible = false;
}
var p_queue = ds_priority_create();
//queueItems[0] = pony.stamina;
//queueItems[1] = newMoveMap;
//queueItems[2] = 0;
//ds_priority_add(p_queue, queueItems, pony.stamina);
move_node_add_to_queue(p_queue, newMoveMap)
while(!ds_priority_empty(p_queue)) {
    move_map_queue_neighbors(p_queue, ds_priority_delete_min(p_queue));
}
ds_priority_destroy(p_queue);
return newMoveMap;
