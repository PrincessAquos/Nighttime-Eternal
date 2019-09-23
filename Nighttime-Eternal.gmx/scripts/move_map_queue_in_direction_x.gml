///move_map_queue_in_direction(pQueue, moveNode, targetDir)

// DEPRECATED

// targetDir is the direction that will be traveled from the moveNode to make the new node
var pQueue = argument[0];
var moveNode = argument[1];
var targetDir = argument[2];

//var new_node = move_map_new_node_from_previous(moveNode, targetDir);
//SET THE LEFT/RIGHT/UP/DOWN VALUES DEPENING ON TARGETDIR
//moveNode.right = new_node;
if (new_node != noone) {
    move_node_add_to_queue(pQueue, new_node, targetDir);
}

