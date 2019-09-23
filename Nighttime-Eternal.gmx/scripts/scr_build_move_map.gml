///scr_build_move_map(currX, currY, stamina, dir, inst, prev)
var currX = argument[0];
var currY = argument[1];
var stamina = argument[2];
var dir = argument[3];
var inst = argument[4];
var prev = argument[5];

var node = noone;
var optimal = false;

//get floor tile instance id
var moveTile = instance_position(currX, currY, obj_movetile);
if (moveTile == noone || moveTile.isWall) {
    stamina = -1;
}
else if (dir != 0){
    stamina -= moveTile.stamCost;
}
if (dir == 0) {
    node = instance_create(currX, currY, obj_move_map);
    with(node) {
        visible = false;
        pony = inst;
        head = true;
        right = scr_build_move_map(currX + 32, currY, stamina, 1, inst, id);
        left = scr_build_move_map(currX - 32, currY, stamina, -1, inst, id);
        up = scr_build_move_map(currX, currY - 32, stamina, -2, inst, id);
        down = scr_build_move_map(currX, currY + 32, stamina, 2, inst, id);
    }
}
else if (stamina >= 0) {
    //Tries to get a node from the space
    node = instance_position(currX, currY, obj_move_map);
    //Loops through nodes in the same location
    while (node != noone) && (node.pony != inst) {
        //Deactivates nodes in the way
        instance_deactivate_object(node);
        //Gets the next node in the location
        node = instance_position(currX, currY, obj_move_map);
    }
    instance_activate_object(obj_move_map); //REACTIVATES ALL MOVE NODES.
    if (node != noone && node.head) {
        node = noone
    }
    else if (node == noone) { 
        node = instance_create(currX, currY, obj_move_node);
        with(node) {
            visible = false;
            tile = moveTile;
            maxStam = stamina;
            optimalDir = dir * -1;
            pony = inst;
        }
        optimal = true;
    }
    else if (node.maxStam < stamina) {
        with(node) {
            maxStam = stamina;
            optimalDir = dir * -1;
        }
        optimal = true;
    }
    //Checks the stamina remaining against equipped attack costs
    //Assigns the attack stage of the node
    if (optimal) {
        if (stamina >= inst.atk4) {
            with(node) {
                atkStage = 4;
            }
        }
        else if (stamina >= inst.atk3) {
            with(node) {
                atkStage = 3;
            }
        }
        else if (stamina >= inst.atk2) {
            with(node) {
                atkStage = 2;
            }
        }
        else if (stamina >= inst.atk1) {
            with(node) {
                atkStage = 1;
            }
        }
        //By default, assigns atkStage 0 (only movement, no attack).
        else {
            with(node) {
                atkStage = 0;
            }
        }
        //initial case
        
        //inst = 
        if (dir == 1) {
            with(node) {
                right = scr_build_move_map(currX + 32, currY, stamina, 1, inst, id);
                left = prev;
                up = scr_build_move_map(currX, currY - 32, stamina, -2, inst, id);
                down = scr_build_move_map(currX, currY + 32, stamina, 2, inst, id);
            }
        }
        else if (dir == -1) {
            with(node) {
                right = prev;
                left = scr_build_move_map(currX - 32, currY, stamina, -1, inst, id);
                up = scr_build_move_map(currX, currY - 32, stamina, -2, inst, id);
                down = scr_build_move_map(currX, currY + 32, stamina, 2, inst, id);
            }
        }
        else if (dir == -2) {
            with(node) {
                right = scr_build_move_map(currX + 32, currY, stamina, 1, inst, id);
                left = scr_build_move_map(currX - 32, currY, stamina, -1, inst, id);
                up = scr_build_move_map(currX, currY - 32, stamina, -2, inst, id);
                down = prev;
            }
        }
        else if (dir == 2) {
            with(node) {
                right = scr_build_move_map(currX + 32, currY, stamina, 1, inst, id);
                left = scr_build_move_map(currX - 32, currY, stamina, -1, inst, id);
                up = prev;
                down = scr_build_move_map(currX, currY + 32, stamina, 2, inst, id);
            }
        }
    }
}
return node;
/*
var right = instance_position(x + 32, y, obj_movetile);
var left = instance_position(x - 32, y, obj_movetile);
var up = instance_position(x, y - 32, obj_movetile);
var down = instance_position(x, y + 32, obj_movetile);

if (right != noone) {
    with (right) {
        visible = true;
    }
}
*/
