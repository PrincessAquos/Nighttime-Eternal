///scr_add_to_path(tempX, tempY)
tempX = argument[0];
tempY = argument[1];

newPathTile = instance_create(tempX, tempY, obj_path_tile)

newPathTile.node = node2
if (node2 == node1.moveMap.left) {
newPathTile.image_index = 0;
}
if (node2 == node1.moveMap.right) {
newPathTile.image_index = 1
}
if (node2 == node1.moveMap.up) {
newPathTile.image_index = 2
}
if (node2 == node1.moveMap.down) {
newPathTile.image_index = 3
}

ds_list_insert(pathList, 0, newPathTile); 
