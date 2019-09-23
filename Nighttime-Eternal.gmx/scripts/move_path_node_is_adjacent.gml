///move_path_node_is_adjacent(path, argNode)

var path = argument[0];
var argNode = argument[1];

var temp = move_path_get_head(path).node;

return argNode == temp.right || argNode == temp.left || argNode == temp.up || argNode == temp.down;
