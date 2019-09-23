/// get_map_from_json(file_name)

file_name = argument[0];

var json_file = file_text_open_read(file_name);
var data = "";
while (!file_text_eof(json_file)) {
    data += file_text_read_string(json_file);
    file_text_readln(json_file);
}
file_text_close(json_file);

return json_decode(data);
