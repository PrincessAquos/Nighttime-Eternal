///update_move_node(moveNode, newStamina, argOptimalDir, prevNode, pQueue)
// Updates maxStam, optimalDir, and connecting node of a moveNode, and updates the queue
var moveNode = argument[0];
var newStamina = argument[1];
var argOptimalDir = argument[2];
var prevNode = argument[3];
var pQueue = argument[4];

with (moveNode) {
    maxStam = newStamina;
    optimalDir = argOptimalDir;    
}
// Since the mapping doesn't backtrack, set prevNode as an adjacent node
set_connecting_node(moveNode, argOptimalDir, prevNode);

// Only add a new value to the queue if not already in the queue
if (ds_priority_find_priority(pQueue, moveNode) == undefined) {
    move_node_add_to_queue(pQueue, moveNode)
}
// Otherwise, update the node's priority 
else {
    ds_priority_change_priority(pQueue, moveNode, newStamina);
}
