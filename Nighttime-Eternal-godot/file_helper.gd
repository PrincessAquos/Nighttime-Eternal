extends Reference

class_name FileHelper

static func load_file(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var content = file.get_as_text()
	file.close()
	return content


static func get_json_dict(filename, expected_type):
	var plain_text = load_file(filename)
	var json = JSON.parse(plain_text)
	var result = json.get_result()
	
	if typeof(result) == expected_type:
		return result
	else:
		print("Error parsing JSON for file '" + filename + "'\n\n" +
				"Error '" + json.get_error_string() + 
				"' encountered at line " + json.get_error_line())
		return {"uh oh": "error"}
