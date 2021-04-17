extends KinematicBody2D

class_name Character

const Team = preload("res://char_components/team.gd").Team

const SPEED = 2

var team:int
var grid_pos:Vector2
var char_name:String
var appearance:Appearance
var level:int
var char_class:CharacterClass
var move_map:MoveMap
var actions:Array = []
var stats:Dictionary = {
	"hp": null,
	"stamina": null,
	"resource": null,
	"strength": null,
	"defense": null,
	"intellect": null,
	"resilience": null,
	"agility": null,
	"luck": null
}

var move_path:PathTileMap = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func setup(char_id:String, pos:Vector2, levelmap:LevelMap, movemaps:Node2D, in_team:int = Team.ALLY):
	team = in_team
	
	# Get the base character data
	var db_identity = Data.identities.get(char_id)
	
	level = 1
	
	# Character's display name
	char_name = db_identity.name
	
	char_class = CharacterClass.new(db_identity.class_0)
	
	actions = char_class.get_actions()
	
	# Load the appearance data
	var appear_scene = preload("res://char_components/appearance.tscn")
	appearance = appear_scene.instance()
	appearance.setup_db(db_identity)
	#appearance.setup_dict(json_dict.appearance)
	add_child(appearance)
	
	var base_stats = Data.basestats.get(char_id)
	var growths = Data.growths.get(char_id)
	
	stats = {
		"hp": ValueStat.new(level, base_stats.hp, growths.hp),
		"stamina": ValueStat.new(level, base_stats.stamina, growths.stamina),
		"resource": ValueStat.new(level, base_stats.resource, growths.resource),
		"strength": Stat.new(level, base_stats.stren, growths.stren),
		"defense": Stat.new(level, base_stats.def, growths.def),
		"intellect": Stat.new(level, base_stats.intel, growths.intel),
		"resilience": Stat.new(level, base_stats.resil, growths.resil),
		"agility": Stat.new(level, base_stats.agi, growths.agi),
		"luck": Stat.new(level, base_stats.luck, growths.luck)
	}
	
	position = pos
	grid_pos = position/32
	
	move_map = MoveMap.new(levelmap, self)
	# move_map = MoveMap.new(levelmap, grid_pos, 90, actions)
	movemaps.add_child(move_map)


func refresh_movemap():
	move_map.generate_move_map(stats.stamina.curr_val, actions)


func start_moving(pathmap:PathTileMap):
	# start moving in here
	print(pathmap.path)
	move_path = pathmap
	appearance.is_running = true
	

func move():
	if !move_path.path.empty():
		var target = move_path.path[0]
		var move_to = Vector2(target.x * 32, target.y * 32)
		#position = move_to
		position = Vector2(move_toward(position.x, move_to.x, SPEED), move_toward(position.y, move_to.y, SPEED))
		if position == move_to:
			grid_pos = position/32
			move_path.path.remove(0)
	else:
		appearance.is_running = false
		print(move_path.stam_cost)
		stats.stamina.decrease(move_path.stam_cost)
		print("hi")
		move_path = null


func _process(delta):
	if move_path != null:
		move()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
