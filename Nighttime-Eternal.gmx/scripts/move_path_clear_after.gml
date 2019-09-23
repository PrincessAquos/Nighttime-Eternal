///move_path_clear_after(path, argPathTile)
var path = argument[0];
var argPathTile = argument[1];

if (path != noone && path.head != noone) {
    var tempPathTile = path.head;
    while (tempPathTile != argPathTile) {
        move_path_delete_head(path)
        tempPathTile = path.head;
    }
}
