extends MarginContainer

const DB = preload("res://db/data.cdb")
const BodyVariant = DB.Identities.BodyVariant

var active = false setget active_set
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func load_portrait(appearance:Appearance):
	
	material = appearance.get_palette_shader()
	
	#head_accessory_1 = load_sprite_db(db_row.head_accessory_1, "accessory")
	#body_accessory_1 = load_sprite_db(db_row.body_accessory_1, "accessory")
	
	#body = load_sprite_db(db_row.body_model, "body")
	#running = load_sprite_db(db_row.body_model, "body", "_run.tres")
	
	#head_accessory_2 = load_sprite_db(db_row.head_accessory_2, "accessory")
	#body_accessory_2 = load_sprite_db(db_row.body_accessory_2, "accessory")
	
	#bg_mane = load_sprite_db(db_row.mane_model, "mane", "_BG.png")
	#horn = load_sprite_db(db_row.body_model, "body", "_horn.png")
	#fg_mane = load_sprite_db(db_row.mane_model, "mane", "_FG.png")
	#tail = load_sprite_db(db_row.tail_model, "tail")
	#cutie_mark = load_sprite_db(db_row.cutie_mark, "cutie_mark")
	
	#head_accessory_3 = load_sprite_db(db_row.head_accessory_3, "accessory")
	#body_accessory_3 = load_sprite_db(db_row.body_accessory_3, "accessory")


func active_set(new_val):
	active = new_val
	visible = active
	return
