///scr_build_move_map_BFS(argPony)
var argPony = argument[0];

var newMoveMap = instance_create(pony.x, pony.y, obj_move_map);
with (newMoveMap) {
    pony = argPony;
    maxStam = argPony.stamina;
    head = true;
    visible = false;
}
var queue = ds_queue_create();
var queueItems;
queueItems[0] = pony.stamina;
queueItems[1] = newMoveMap;
queueItems[2] = 0;
ds_queue_enqueue(queue, queueItems);
while(!ds_queue_empty(queue)) {
    move_map_create_new_nodes(pony, ds_queue_dequeue(queue));
}
ds_queue_destroy(queue);
