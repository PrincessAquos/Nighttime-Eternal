///move_map_get_node(argX, argY, argPony)
argX = argument[0];
argY = argument[1];
argPony = argument[2];

//Tries to get a node from the space
var node = instance_position(argX, argY, obj_move_map);
//Loops through nodes in the same location
while ((node != noone) && (node.pony != argPony)) || ((node != noone) && (node.destroy)) {
    //Deactivates nodes in the way
    instance_deactivate_object(node);
    //Gets the next node in the location
    node = instance_position(argX, argY, obj_move_map);
}
instance_activate_object(obj_move_map); //REACTIVATES ALL MOVE NODES.

return node;
