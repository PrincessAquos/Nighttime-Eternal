///move_path_get(path, index)

var path = argument[0];
var index = argument[1];

var temp = move_path_get_head(path);
var n = 0;

while (n < index && temp.prev != noone) {
    temp = temp.prev;
    n++;
}
return temp;
