/// Creates paths
if (clickedChar != noone) {
    var node = move_map_get_node(x, y, clickedChar);
    
    if (node != noone) {
    /* CURRENT WORK SPACE */
        var valid = true;
        if node.head {
            move_path_clear(movePath)
            //reset tempStamina
            tempStamina = clickedChar.stamina;
        }
        else if (move_path_is_empty(movePath)) {
            tempStamina = clickedChar.stamina;
            tempStamina -= node.tile.stamCost;
            move_path_add(movePath, node);
        }
        else if (node != movePath.head.node) {
            if (move_path_node_is_adjacent(movePath, node)) {
                if (movePath.head.prev != noone) {
                    if (node == move_path_get(movePath, 1).node) {
                        var temp = movePath.head.prev;
                        temp.next = noone;
                        tempStamina += movePath.head.node.tile.stamCost
                        with (movePath.head) instance_destroy();
                        movePath.head = temp
                        
                    }
                    else {
                        if (tempStamina - node.tile.stamCost < 0) valid = false;
                        var tempPath = movePath.head
                        var j = 0;
                        while(movePath.head.prev != noone && valid) {
                            if (node == tempPath.node) {
                                valid = false;
                            }
                            tempPath = tempPath.prev;
                        }
                        if valid {
                            move_path_add(movePath, node)
                            tempStamina -= node.tile.stamCost;
                        }
                    }
                }
                else {
                    move_path_add(movePath, node)
                    tempStamina -= node.tile.stamCost;
                }
            }
            else valid = false;
            if !valid {
                    tempStamina = clickedChar.stamina;
                    move_path_clear(movePath);
                    var j = 0; 
                    while (true) {
// CURRENT THING I'M WORKING ON
                        if (node.head == true) break;
                        var tempPath2 = move_path_get(movePath, j)
                        ds_list_add(movePath, node);
                        ds_list_add(pathGraphics.sprite_indexes, 2);
                        tempStamina -= node.tile.stamCost;
                        if (node.optimalDir == -1) node = node.left;
                        else if (node.optimalDir == 1) node = node.right;
                        else if (node.optimalDir == -2) node = node.up;
                        else if (node.optimalDir == 2) node = node.down;
                    }
            }
            
        }       
    /* CURRENT WORK SPACE */
    /*
            while (!ds_list_empty(movePath)) {
                with (movePath[| 0]) visible = true;
                ds_list_delete(movePath, 0);
            }
            movePath = ds_list_create();
            
            while (node.head == false || node.optimalDir != 0) {
                ds_list_add(movePath, node);
                with (node) visible = false;
                if (node.optimalDir == -1) node = node.left;
                else if (node.optimalDir == 1) node = node.right;
                else if (node.optimalDir == -2) node = node.up;
                else if (node.optimalDir == 2) node = node.down;
            }
            */
    }
}
