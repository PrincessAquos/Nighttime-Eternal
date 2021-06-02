extends MarginContainer

class_name PanelCharacter

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var test_level_map = preload("res://maps/test_map.tscn")

var active = false setget active_set

var name_label:Label
var class_label:Label

var class_rank:MarginContainer
var portrait:MarginContainer
var stats_panel:MarginContainer
var health_bar:MarginContainer
var magic_bar:MarginContainer
var stamina_bar:MarginContainer
var special_talent_panel:MarginContainer
var actions_panel:MarginContainer


const NAME_CLASS_BARS_PATH = "BGMargin/Columns/Main Section/HBoxContainer/" \
						   + "NameClassBarsColumn/"
const NAME_CLASS_PATH = NAME_CLASS_BARS_PATH + "NameClass/Body/"
const BARS_PATH = NAME_CLASS_BARS_PATH + "Bars/VBoxContainer/"

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label = get_node(NAME_CLASS_PATH + "Name/Label")
	class_label = get_node(NAME_CLASS_PATH + "ClassRank/Class/Label")
	class_rank = get_node(NAME_CLASS_PATH + "ClassRank/Rank")
	
	portrait = get_node("BGMargin/Columns/PortraitStats/PortraitBorder/Portrait")
	stats_panel = get_node("BGMargin/Columns/PortraitStats/Stats")
	
	health_bar = get_node(BARS_PATH + "HealthBar")
	magic_bar = get_node(BARS_PATH + "MagicBar")
	stamina_bar = get_node(BARS_PATH + "StaminaBar")
	
	special_talent_panel = get_node("BGMargin/Columns/Main Section/"
								  + "HBoxContainer/TalentColumn/MarkAndLevel")
	
	actions_panel = get_node("BGMargin/Columns/Main Section/Actions")
	
	test()
	
func active_set(new_val):
	active = new_val
	
	name_label.visible = new_val
	class_label.visible = new_val
	class_rank.visible = new_val
	
	portrait.active = new_val
	stats_panel.active = new_val
	
	health_bar.active = new_val
	magic_bar.active = new_val
	stamina_bar.active = new_val
	
	special_talent_panel.active = new_val
	
	actions_panel.active = new_val
	

# Takes in a character and updates all the elements of the ui pane
func update_ui(character:Character):
	if character == null:
		active_set(false)
	else:
		name_label.text = character.char_name
		class_label.text = character.char_class.title
		class_rank.value = character.char_class.rank
		
		resource_bar_update(character.stats)
		
		portrait.load_portrait(character.appearance)
		
		stats_panel.stat_labels_update(character.stats)
		
		actions_panel.assign_buttons(character, character.actions)
		active_set(true)


func resource_bar_update(stats):
	var hp:ValueStat = stats.hp
	var resource:ValueStat = stats.resource
	var stamina:ValueStat = stats.stamina
	
	health_bar.curr_val = hp.curr_val
	health_bar.max_val = hp.val
	
	magic_bar.curr_val = resource.curr_val
	magic_bar.max_val = resource.val
	
	stamina_bar.curr_val = stamina.curr_val
	stamina_bar.max_val = stamina.val


func test():
	var test_char = Character.new()
	test_char.setup("twilight", Vector2(0, 0))
	
	update_ui(test_char)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
