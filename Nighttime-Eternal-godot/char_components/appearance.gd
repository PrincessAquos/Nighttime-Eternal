extends ViewportContainer

class_name Appearance

const DB = preload("res://db/data.cdb")
const BodyVariant = DB.Identities.BodyVariant

# Property and Component Variables
var body_variant = BodyVariant.EARTH

var palette = -1

var head_accessory_1 = -1
var body_accessory_1 = -1

var body = -1
var running = -1

var head_accessory_2 = -1
var body_accessory_2 = -1

var horn = -1
var fg_mane = -1
var bg_mane = -1
var tail = -1
var cutie_mark = -1

var head_accessory_3 = -1
var body_accessory_3 = -1

var head_nodes = []

# Programmy Properties
var is_running = false setget set_running

const RUNNING_HEAD_POS = [
	Vector2(0, 0),
	Vector2(-1, 0),
	Vector2(-2, 0),
	Vector2(-2, 1),
	Vector2(-3, 1),
	Vector2(-2, 1),
	Vector2(-1, 1),
	Vector2(0, 1),
]


func load_sprite(appear_dict, subfolder, key, postfix=".png"):
	if key in appear_dict:
		var d = Directory.new()
		var path = "res://sprites/" + subfolder + "/" + appear_dict[key] + postfix
		if d.file_exists(path):
			return load(path)
		else:
			print("Sprite requested at \"" + path + "\" does not exist.")
	else:
		return -1


func load_sprite_db(val, subfolder, postfix=".png"):
	if val != "":
		var d = Directory.new()
		var path = "res://sprites/" + subfolder + "/" + val + postfix
		if d.file_exists(path):
			return load(path)
		else:
			print("Sprite requested at \"" + path + "\" does not exist.")
	else:
		return -1


func setup_db(db_row:DB.Identities.IdentitiesRow):
	
	body_variant = db_row.body_variant
	
	palette = load_sprite_db(db_row.palette, "palette")
	
	head_accessory_1 = load_sprite_db(db_row.head_accessory_1, "accessory")
	body_accessory_1 = load_sprite_db(db_row.body_accessory_1, "accessory")
	
	body = load_sprite_db(db_row.body_model, "body")
	running = load_sprite_db(db_row.body_model, "body", "_run.tres")
	
	head_accessory_2 = load_sprite_db(db_row.head_accessory_2, "accessory")
	body_accessory_2 = load_sprite_db(db_row.body_accessory_2, "accessory")
	
	bg_mane = load_sprite_db(db_row.mane_model, "mane", "_BG.png")
	horn = load_sprite_db(db_row.body_model, "body", "_horn.png")
	fg_mane = load_sprite_db(db_row.mane_model, "mane", "_FG.png")
	tail = load_sprite_db(db_row.tail_model, "tail")
	cutie_mark = load_sprite_db(db_row.cutie_mark, "cutie_mark")
	
	head_accessory_3 = load_sprite_db(db_row.head_accessory_3, "accessory")
	body_accessory_3 = load_sprite_db(db_row.body_accessory_3, "accessory")


func setup_dict(this_dict):
	
	body_variant = this_dict["body_variant"]
	
	palette = load_sprite(this_dict, "palette", "palette")
	
	head_accessory_1 = load_sprite(this_dict, "accessory", "head_accessory_1")
	body_accessory_1 = load_sprite(this_dict, "accessory", "body_accessory_1")
	
	body = load_sprite(this_dict, "body", "body_model")
	running = load_sprite(this_dict, "body", "body_model", "_run.tres")
	
	head_accessory_2 = load_sprite(this_dict, "accessory", "head_accessory_2")
	body_accessory_2 = load_sprite(this_dict, "accessory", "body_accessory_2")
	
	bg_mane = load_sprite(this_dict, "mane", "mane_model", "_BG.png")
	horn = load_sprite(this_dict, "body", "body_model", "_horn.png")
	fg_mane = load_sprite(this_dict, "mane", "mane_model", "_FG.png")
	tail = load_sprite(this_dict, "tail", "tail_model")
	cutie_mark = load_sprite(this_dict, "cutie_mark", "cutie_mark")
	
	head_accessory_3 = load_sprite(this_dict, "accessory", "head_accessory_3")
	body_accessory_3 = load_sprite(this_dict, "accessory", "body_accessory_3")


func get_palette_shader():
	return get_node("Viewport/Character").material


func initialize():
	if(palette is StreamTexture):
		var shader_material = get_palette_shader().duplicate()
		shader_material.set_shader_param("palette_size", palette.get_width())
		shader_material.set_shader_param("palette", palette)
		get_node("Viewport/Character").material = shader_material
	
	if(running is AnimatedSprite):
		get_node("Viewport/Character/Running").frames = running
	
	var horn_node = get_node("Viewport/Character/Horn")
	if horn is StreamTexture:
		horn_node.texture = horn
	if body_variant == BodyVariant.UNICORN || body_variant == BodyVariant.ALICORN:
		horn_node.visible = true
	else:
		horn_node.visible = false
	
	var param_list = [
		["Head Accessory 1", head_accessory_1],
		["Body Accessory 1", body_accessory_1],
		["Body", body],
		["Running", running],
		["Head Accessory 2", head_accessory_2],
		["Body Accessory 2", body_accessory_2],
		["ManeBG", bg_mane],
		["ManeFG", fg_mane],
		["Tail", tail],
		["Cutie Mark", cutie_mark],
		["Head Accessory 3", head_accessory_3],
		["Body Accessory 3", body_accessory_3]
	]
	var node
	for params in param_list:
		node = get_node("Viewport/Character/" + params[0])
		if(params[1] is StreamTexture):
			node.texture = params[1]
			node.visible = true
		else:
			node.visible = false
	
	# get_node("Viewport/Character/Body").texture = body
	# get_node("Viewport/Character/Running").frames = running
	# get_node("Viewport/Character/Horn").texture = horn
	# get_node("Viewport/Character/ManeFG").texture = fg_mane
	# get_node("Viewport/Character/ManeBG").texture = bg_mane
	# get_node("Viewport/Character/Tail").texture = tail
	# get_node("Viewport/Character/Cutie Mark").texture = mark
	return


func _ready():
	initialize()
	var head_elem_suffixes = [
		"Head Accessory 1",
		"Head Accessory 2",
		"ManeBG",
		"Horn",
		"ManeFG",
		"Head Accessory 3"
	]
	for suffix in head_elem_suffixes:
		head_nodes.append(get_node("Viewport/Character/" + suffix))
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_running(new_value):
	is_running = new_value
	var body_node = get_node("Viewport/Character/Body")
	var run_node = get_node("Viewport/Character/Running")
	if is_running:
		run_node.frame = 0
		run_node.playing = true
		run_node.visible = true
		body_node.visible = false
	else:
		body_node.visible = true
		run_node.visible = false
		run_node.playing = false
		run_node.frame = 0


func _on_Running_frame_changed():
	# Get the current frame number
	var run_node = get_node("Viewport/Character/Running")
	# Offset all the head sprites accordingly using the RUNNING_HEAD_POS array
	for node in head_nodes:
		node.offset = RUNNING_HEAD_POS[run_node.frame]
	return # Replace with function body.
