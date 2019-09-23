///move_path_clear(path)

var path = argument[0];

if (path != noone) {
    while (path.head != noone) {
        move_path_delete_head(path);
    }
}
path.stamina = path.pony.stamina;
