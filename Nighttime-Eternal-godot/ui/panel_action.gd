extends MarginContainer

const DB = preload("res://db/data.cdb")
const DmgType = DB.Actions.DmgType

const TEX_USABLE_BG = preload("res://ui/char_action_button.png")
const TEX_UNUSABLE_BG = preload("res://ui/char_action_button_unusable.png")

const TEX_USABLE_STAM_ICON = preload("res://ui/char_bar_stamina_icon.png")
const TEX_UNUSABLE_STAM_ICON = preload("res://ui/char_bar_stamina_icon_unusable.png")

const TEX_USABLE_MANA_ICON = preload("res://ui/char_bar_magic_icon.png")

const TEX_USABLE_PHYS_ICON = preload("res://ui/char_act_icon_physical.png")
const TEX_UNUSABLE_PHYS_ICON = preload("res://ui/char_act_icon_physical_unusable.png")

const TEX_USABLE_MAGIC_ICON = preload("res://ui/char_act_icon_magic.png")
const TEX_UNUSABLE_MAGIC_ICON = preload("res://ui/char_act_icon_magic_unusable.png")

var act:Action = null
var act_name:String = "Test it, See it!?" setget name_set
var cost:int = 25 setget cost_set
var res_cost:int = 4 setget res_cost_set
var dmg:int = 8 setget dmg_set
var dmg_type:int setget dmg_type_set
var usable = true setget usable_set

var act_button:TextureButton
var name_label:Label
var cost_label:Label
var cost_icon:TextureRect
var res_cost_label:Label
var res_cost_icon:TextureRect
var dmg_label:Label
var dmg_icon:TextureRect

func assign_action(character, action):
	if action == null:
		visible = false
		act = null
	else:
		act = action
		name_set(action.display_name)
		dmg_set(action.get_damage(character))
		cost_set(action.stam_cost)
		res_cost_set(action.res_cost)
		dmg_type_set(action.dmg_type)
		usable_set(action.usable)
		visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	act_button = get_node("TextureButton")
	name_label = get_node("HBoxContainer/NameMargin/ActName")
	cost_label = get_node("HBoxContainer/CostMargin/CenterContainer/MarginContainer/ValueMargin/Label")
	cost_icon = get_node("HBoxContainer/CostMargin/CenterContainer/MarginContainer/IconMargin/CostIcon")
	res_cost_label = get_node("HBoxContainer/CostMargin2/CenterContainer/MarginContainer/ValueMargin/Label")
	res_cost_icon = get_node("HBoxContainer/CostMargin2/CenterContainer/MarginContainer/IconMargin/CostIcon")
	dmg_label = get_node("HBoxContainer/DmgMargin/CenterContainer/MarginContainer/ValueMargin/Label")
	dmg_icon = get_node("HBoxContainer/DmgMargin/CenterContainer/MarginContainer/IconMargin/DmgIcon")

func name_set(new_val):
	act_name = new_val
	name_label.text = act_name

func cost_set(new_val):
	cost = new_val
	cost_label.text = String(cost)

func dmg_type_set(new_val):
	dmg_type = new_val
	dmg_icon.texture = TEX_USABLE_PHYS_ICON

func dmg_set(new_val):
	dmg = new_val
	dmg_label.text = String(dmg)

func res_cost_set(new_val):
	res_cost = new_val
	res_cost_label.text = String(res_cost)

func usable_set(new_val):
	usable = new_val
	if usable:
		set_label_colors(Color("#000000"))
		act_button.texture_normal = TEX_USABLE_BG
		cost_icon.texture = TEX_USABLE_STAM_ICON
		res_cost_icon.texture = TEX_USABLE_MANA_ICON
		match(dmg_type):
			DmgType.MAGIC:
				dmg_icon.texture = TEX_USABLE_MAGIC_ICON
			DmgType.PHYSICAL:
				dmg_icon.texture = TEX_USABLE_PHYS_ICON
		
	else:
		set_label_colors(Color("#d2d2d2"))
		act_button.texture_normal = TEX_UNUSABLE_BG
		cost_icon.texture = TEX_UNUSABLE_STAM_ICON
		res_cost_icon.texture = TEX_USABLE_MANA_ICON
		match(dmg_type):
			DmgType.MAGIC:
				dmg_icon.texture = TEX_UNUSABLE_MAGIC_ICON
			DmgType.PHYSICAL:
				dmg_icon.texture = TEX_UNUSABLE_PHYS_ICON

func set_label_colors(color):
	name_label.add_color_override("font_color", color)
	cost_label.add_color_override("font_color", color)
	res_cost_label.add_color_override("font_color", color)
	dmg_label.add_color_override("font_color", color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
