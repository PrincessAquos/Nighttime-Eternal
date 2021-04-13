extends Control

onready var char_hud_1:PanelCharacter = get_node("HBoxContainer/HUDContainer/HUDView/MarginContainer/VBoxContainer/CharacterHUD1")
onready var char_hud_2:PanelCharacter = get_node("HBoxContainer/HUDContainer/HUDView/MarginContainer/VBoxContainer/CharacterHUD2")

var cursor:Cursor = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var level_list = get_node("HBoxContainer/LevelContainer/LevelView").get_children()
	var stage:Stage = null
	if level_list.size() > 0:
		stage = level_list[0]
		cursor = stage.cursor
	return # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cursor.clicked_char_changed:
		if cursor.clicked_char != null:
			char_hud_1.update_ui(cursor.clicked_char)
			if cursor.clicked_char != cursor.selected_char:
				char_hud_2.update_ui(cursor.selected_char)
		else:
			char_hud_1.update_ui(cursor.selected_char)
			char_hud_2.update_ui(cursor.clicked_char)
	if cursor.selected_char_changed:
		if cursor.clicked_char != null and cursor.clicked_char != cursor.selected_char:
			char_hud_2.update_ui(cursor.selected_char)
		else:
			char_hud_2.update_ui(null)
			char_hud_1.update_ui(cursor.selected_char)
	return
