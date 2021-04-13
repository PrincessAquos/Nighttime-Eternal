extends Node2D

var ponies
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var character_scene = preload("res://char_components/character.tscn")
	
	var pony_names = [
		"Twilight Sparkle",
		"Sunset Shimmer",
		"Applejack",
	]
	
	ponies = []
	
	var pos = Vector2(0, 0)
	for pony_name in pony_names:
		var inst = character_scene.instance()
		ponies.append(inst)
		inst.setup(pony_name)
		inst.position = pos
		add_child(inst)
		pos.x += 32
		
	#twi = character_scene.instance()
	#twi.setup("Twilight Sparkle")
	
	#sunset = character_scene.instance()
	#sunset.setup("Sunset Shimmer")
	#sunset.position.x += 32
	
	#aj = character_scene.instance()
	#aj.setup("Applejack")
	#aj.position.x += 64
	
	#add_child(twi)
	#add_child(sunset)
	#add_child(aj)
	
	return # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
