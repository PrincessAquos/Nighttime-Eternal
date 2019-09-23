///move_map_queue_neighbors(pQueue, queueItems)
var pQueue = argument[0];
//var queueItems = argument[1]; // The ds_list popped off of the priority queue
                                // The queue is organized as follows:
                                // [moveNode, staminaRemaining, direction, previousNode]

var moveNode = argument[1];
var sourceDir = moveNode.optimalDir;
//var dir                 = queue_items_get_direction(queueItems);
//var staminaRemaining    = ds_list_find_value(queueItems, 1);
//var previousNode        = ds_list_find_value(queueItems, 3);
                  
var directions;
directions[0] = get_direction("RIGHT");
directions[1] = get_direction("LEFT");
directions[2] = get_direction("UP");
directions[3] = get_direction("DOWN");

// Attempt to queue only in directions other than the one that you came from
var thisDir = get_direction("RIGHT")
if (sourceDir != thisDir) {
    moveNode.right = move_map_queue_in_direction(pQueue, moveNode, thisDir)
}
thisDir = get_direction("LEFT")
if (sourceDir != thisDir) {
    moveNode.left = move_map_queue_in_direction(pQueue, moveNode, thisDir)
}
thisDir = get_direction("UP")
if (sourceDir != thisDir) {
    moveNode.up = move_map_queue_in_direction(pQueue, moveNode, thisDir)
}
thisDir = get_direction("DOWN")
if (sourceDir != thisDir) {
    moveNode.down = move_map_queue_in_direction(pQueue, moveNode, thisDir)
}

//ds_list_destroy(queueItems);

// END OF CODE

// The source direction used to be passed in via the queue, and represented the direction
// traveled to reach the current node. Below is the old code.
// The new code simply uses the optimal direction attached to the node. 
// The optimal direction indicates the direction to move from the current
// node in order to form the cheapest path to the node from the head of the map.
//if (dir != get_direction("FROMRIGHT")) {
//    move_map_queue_in_direction(pQueue, moveNode, get_direction("FROMRIGHT"))
//}
//else moveNode.right = previousNode;
//if (dir != get_direction("FROMLEFT")) {
//    moveNode.left = move_map_create_new_node(moveNode, get_direction("LEFT"));
//}
//else moveNode.left = previousNode;
//if (dir != get_direction("FROMUP")) {
//    moveNode.up = move_map_create_new_node(moveNode, get_direction("UP"));
//}
//else moveNode.up = previousNode;
//if (dir != get_direction("FROMDOWN")) {
//    moveNode.down = move_map_create_new_node(moveNode, get_direction("DOWN"));
//}
//else moveNode.down = previousNode;
