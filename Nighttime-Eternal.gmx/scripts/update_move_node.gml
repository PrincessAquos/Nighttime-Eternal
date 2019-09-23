///update_move_node(moveNode, newStamina, argOptimalDir, prevNode)
var moveNode = argument[0];
var newStamina = argument[1];
var argOptimalDir = argument[2];
var prevNode = argument[3];

with (moveNode) {
    maxStam = newStamina;
    optimalDir = argOptimalDir;    
}
set_connecting_node(moveNode, argOptimalDir, prevNode);
