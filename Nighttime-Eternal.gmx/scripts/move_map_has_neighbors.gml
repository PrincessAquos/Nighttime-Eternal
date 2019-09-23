///move_map_has_neighbors(moveMap)
var moveMap = argument[0];

if (moveMap.left == noone && moveMap.right == noone && moveMap.up == noone && moveMap.down == noone) {
    return false;
}
else return true;
