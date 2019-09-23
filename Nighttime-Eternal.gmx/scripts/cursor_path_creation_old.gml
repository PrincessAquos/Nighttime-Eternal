/// Creates paths
if (clickedChar != noone) {
    var node = instance_position(x, y, obj_move_map);
    //Loops through nodes in the same location
    while (node != noone) && (node.pony != clickedChar) {
        //Deactivates nodes in the way
        instance_deactivate_object(node);
        //Gets the next node in the location
        node = instance_position(x, y, obj_move_map);
    }
    instance_activate_object(obj_move_node); //REACTIVATES ALL MOVE NODES.
    if (node != noone) {
    /* CURRENT WORK SPACE */
        var valid = true;
        if node.head {
            scr_traverse_moves(clickedChar, "make_visible", 0);
            ds_list_clear(movePath);
            if (pathGraphics != noone) {
                with pathGraphics {
                    instance_destroy();
                }
                pathGraphics = noone;
            }
            tempStamina = clickedChar.stamina;
        }
        else if (ds_list_empty(movePath)) {
            if (pathGraphics == noone) {
                pathGraphics = instance_create(x, y, obj_path);
            }
            else {
                ds_list_clear(pathGraphics.sprite_indexes);
            }
            if (node == clickedChar.moveMap.left) {
                ds_list_insert(pathGraphics.sprite_indexes, 0, 0);
            }
            if (node == clickedChar.moveMap.right) {
                ds_list_insert(pathGraphics.sprite_indexes, 0, 1);
            }
            if (node == clickedChar.moveMap.up) {
                ds_list_insert(pathGraphics.sprite_indexes, 0, 2)
            }
            if (node == clickedChar.moveMap.down) {
                ds_list_insert(pathGraphics.sprite_indexes, 0, 3)
            }
            tempStamina = clickedChar.stamina;
            tempStamina -= node.tile.stamCost;
            node.visible = false;
            ds_list_add(movePath, node);
        }
        else if (node != movePath[| 0]) {
            if (node == movePath[| 0].right || node == movePath[| 0].left || node == movePath[| 0].up || node == movePath[| 0].down) {
                if (ds_list_size(movePath) > 1) {
                    if (node == movePath[| 1]) {
                        movePath[| 0].visible = true;
                        tempStamina += movePath[| 0].tile.stamCost
                        ds_list_delete(movePath, 0);
                        ds_list_delete(pathGraphics.sprite_indexes, 0);
                    }
                    else {
                        if (tempStamina - node.tile.stamCost < 0) valid = false;
                        for (var j = 0; j < ds_list_size(movePath) && valid; j++) {
                            if (node == movePath[| j]) {
                                valid = false;
                            }
                        }
                        if valid {
                            node.visible = false;
                            tempStamina -= node.tile.stamCost;
                            ds_list_insert(movePath, 0, node);
                            ds_list_insert(pathGraphics.sprite_indexes, 0, 0)
                        }
                    }
                }
                else {
                    node.visible = false;
                    tempStamina -= node.tile.stamCost;
                    ds_list_insert(movePath, 0, node);
                    ds_list_insert(pathGraphics.sprite_indexes, 0, 0)
                }
            }
            else valid = false;
            if !valid {
                    tempStamina = clickedChar.stamina;
                    while (!ds_list_empty(movePath)) {
                        with (movePath[| 0]) visible = true;
                        ds_list_delete(movePath, 0);
                        ds_list_delete(pathGraphics.sprite_indexes, 0);
                    }
                    while (true) {
                        with (node) visible = false;
                        if (node.head == true) break;
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

