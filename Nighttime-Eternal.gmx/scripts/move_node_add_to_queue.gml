///move_node_add_to_queue(pQueue, moveNode)
// Adds an already created moveNode to the priority queue
var pQueue = argument[0];           // The priority queue
var moveNode = argument[1];         // The move node to queue
//var dir = argument[2];              // The direction traveled to reach this node
//var prevNode = argument[3];         // The node that this one branched off of

//var queueItems = ds_list_create();
//ds_list_add(queueItems, moveNode, dir)
ds_priority_add(pQueue, moveNode, moveNode.maxStam);
