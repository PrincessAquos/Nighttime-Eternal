extends Object

class_name ActFuncs

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

###################
# Damage functions
###################
static func strength_damage(user, base):
	return user.stats.strength.val + base


static func intellect_damage(user, base):
	return user.stats.intellect.val + base


static func resource_damage(user, base):
	return user.stats.resource.val + base


###################
# Defend functions
###################
static func physical_defend(damage, target):
	return damage - target.stats.defense.val


static func magic_defend(damage, target):
	return damage - target.stats.resilience.val


static func absolute_defend(damage, target):
	return damage


static func heal_defend(damage, target):
	return damage


####################
# Perform functions
####################
static func perform_attack(user, damage_func, base, target, defend_func):
	target.stats.hp.curr_val -= defend_func.call_func(damage_func.call_func(user, base), target)


static func perform_heal(user, damage_func, base, target, defend_func):
	target.stats.hp.curr_val += damage_func.call_func(user, base)


#############
# Act Lookup
#############
static func lookup_act(action_id):
	return null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
