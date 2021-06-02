extends Control

export var top_level_ui_path:NodePath
export var char_hud_1_path:NodePath
export var char_hud_2_path:NodePath

onready var top_level_ui = get_node(top_level_ui_path)
onready var char_hud_1:PanelCharacter = get_node(char_hud_1_path)
onready var char_hud_2:PanelCharacter = get_node(char_hud_2_path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.battle_screen = self
	return # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cursor = Game.cursor
	if cursor != null:
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
