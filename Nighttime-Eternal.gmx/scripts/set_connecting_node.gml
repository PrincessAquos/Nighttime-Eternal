///set_connecting_node(moveNode, dir, prevNode)
var moveNode = argument[0];
var dir = argument[1];
var prevNode = argument[2];

switch(dir){
        case -1:
            moveNode.left = prevNode;
            break;
        case 1:
            moveNode.right = prevNode;
            break;
        case -2:
            moveNode.up = prevNode;
            break;
        case 2:
            moveNode.down = prevNode;
            break;
    }
