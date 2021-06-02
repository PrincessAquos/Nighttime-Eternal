extends Node

const CastleDB = preload("res://addons/thejustinwalsh.castledb/castledb_types.gd")

class Identities:
	enum BodyVariant {EARTH, UNICORN, PEGASUS, ALICORN}

	const twilight := "twilight"
	const sunset := "sunset"
	const applejack := "applejack"

	class IdentitiesRow:
		var id := ""
		var name := ""
		var palette := ""
		var body_model := ""
		var body_variant := 0
		var mane_model := ""
		var tail_model := ""
		var cutie_mark := ""
		var head_accessory_1 := ""
		var body_accessory_1 := ""
		var head_accessory_2 := ""
		var body_accessory_2 := ""
		var head_accessory_3 := ""
		var body_accessory_3 := ""
		var class_0 := ""
		var class_1 := ""
		var class_2 := ""
		
		func _init(id = "", name = "", palette = "", body_model = "", body_variant = 0, mane_model = "", tail_model = "", cutie_mark = "", head_accessory_1 = "", body_accessory_1 = "", head_accessory_2 = "", body_accessory_2 = "", head_accessory_3 = "", body_accessory_3 = "", class_0 = "", class_1 = "", class_2 = ""):
			self.id = id
			self.name = name
			self.palette = palette
			self.body_model = body_model
			self.body_variant = body_variant
			self.mane_model = mane_model
			self.tail_model = tail_model
			self.cutie_mark = cutie_mark
			self.head_accessory_1 = head_accessory_1
			self.body_accessory_1 = body_accessory_1
			self.head_accessory_2 = head_accessory_2
			self.body_accessory_2 = body_accessory_2
			self.head_accessory_3 = head_accessory_3
			self.body_accessory_3 = body_accessory_3
			self.class_0 = class_0
			self.class_1 = class_1
			self.class_2 = class_2
	
	var all = [IdentitiesRow.new(twilight, "Twilight Sparkle", "twilight", "mare", 1, "twilight", "twilight", "twilight", "", "", "", "", "", "", "magic_student", "organizer", "bookworm"), IdentitiesRow.new(sunset, "Sunset Shimmer", "sunset", "mare", 1, "sunset", "sunset", "sunset", "", "", "", "", "", "", "princess_protege"), IdentitiesRow.new(applejack, "Applejack", "applejack", "mare", 0, "aj", "aj", "aj", "aj_hat", "", "", "", "", "", "athlete", "farmhand", "gardener")]
	var index = {twilight: 0, sunset: 1, applejack: 2}
	
	func get(id:String) -> IdentitiesRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> IdentitiesRow:
		if idx < all.size():
			return all[idx]
		return null

class BaseStats:

	const twilight := "twilight"
	const sunset := "sunset"
	const applejack := "applejack"

	class BaseStatsRow:
		var id := ""
		var hp := 0
		var stamina := 0
		var resource := 0
		var stren := 0
		var def := 0
		var intel := 0
		var resil := 0
		var agi := 0
		var luck := 0
		
		func _init(id = "", hp = 0, stamina = 0, resource = 0, stren = 0, def = 0, intel = 0, resil = 0, agi = 0, luck = 0):
			self.id = id
			self.hp = hp
			self.stamina = stamina
			self.resource = resource
			self.stren = stren
			self.def = def
			self.intel = intel
			self.resil = resil
			self.agi = agi
			self.luck = luck
	
	var all = [BaseStatsRow.new(twilight, 6, 50, 8, 3, 3, 7, 5, 5, 5), BaseStatsRow.new(sunset, 7, 60, 14, 4, 2, 8, 6, 6, 4), BaseStatsRow.new(applejack, 8, 70, 8, 7, 6, 4, 1, 6, 3)]
	var index = {twilight: 0, sunset: 1, applejack: 2}
	
	func get(id:String) -> BaseStatsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> BaseStatsRow:
		if idx < all.size():
			return all[idx]
		return null

class Growths:

	const twilight := "twilight"
	const sunset := "sunset"
	const applejack := "applejack"

	class GrowthsRow:
		var id := ""
		var hp := 0.0
		var stamina := 0.0
		var resource := 0.0
		var stren := 0.0
		var def := 0.0
		var intel := 0.0
		var resil := 0.0
		var agi := 0.0
		var luck := 0.0
		
		func _init(id = "", hp = 0.0, stamina = 0.0, resource = 0.0, stren = 0.0, def = 0.0, intel = 0.0, resil = 0.0, agi = 0.0, luck = 0.0):
			self.id = id
			self.hp = hp
			self.stamina = stamina
			self.resource = resource
			self.stren = stren
			self.def = def
			self.intel = intel
			self.resil = resil
			self.agi = agi
			self.luck = luck
	
	var all = [GrowthsRow.new(twilight, 0.800000, 0.800000, 1.200000, 0.200000, 0.500000, 1.400000, 1.000000, 0.500000, 0.400000), GrowthsRow.new(sunset, 0.800000, 0.800000, 1.100000, 0.200000, 0.300000, 1.400000, 0.800000, 0.500000, 0.400000), GrowthsRow.new(applejack, 1.200000, 1.400000, 0.600000, 1.000000, 0.800000, 0.400000, 0.200000, 0.800000, 0.400000)]
	var index = {twilight: 0, sunset: 1, applejack: 2}
	
	func get(id:String) -> GrowthsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> GrowthsRow:
		if idx < all.size():
			return all[idx]
		return null

class Actions:
	enum CostType {STAMINA_FIXED, STAMINA_HALF, STAMINA_ALL, STAMINA_MAX, RESOURCE_FIXED, RESOURCE_HALF, RESOURCE_ALL, RESOURCE_MAX, BOTH_FIXED, BOTH_HALF, BOTH_ALL, BOTH_MAX, SPECIAL}
	enum RangeType {SELF, SAME_ELEVATION, LINE_OF_SIGHT, THRU_WALLS, FOUR_DIR}
	enum AreaShape {SINGLE, LINE, DIAMOND, SPECIAL}
	enum DmgType {NA, PHYSICAL, MAGIC, ABSOLUTE, HEAL}
	enum DmgMod {NA, HP, STAMINA, RESOURCE, STREN, DEF, INTEL, RESIL, AGI, LUCK, SPECIAL}

	const magic_missile := "magic_missile"
	const buck := "buck"

	class ActionsRow:
		var id := ""
		var name := ""
		var cost_type := 0
		var cost_stam := 0
		var cost_resource := 0
		var range_type := 0
		var range_min := 0
		var range_max := 0
		var area_shape := 0
		var area_size := 0
		var dmg_base := 0
		var dmg_type := 0
		var dmg_mod := 0
		var Description := ""
		
		func _init(id = "", name = "", cost_type = 0, cost_stam = 0, cost_resource = 0, range_type = 0, range_min = 0, range_max = 0, area_shape = 0, area_size = 0, dmg_base = 0, dmg_type = 0, dmg_mod = 0, Description = ""):
			self.id = id
			self.name = name
			self.cost_type = cost_type
			self.cost_stam = cost_stam
			self.cost_resource = cost_resource
			self.range_type = range_type
			self.range_min = range_min
			self.range_max = range_max
			self.area_shape = area_shape
			self.area_size = area_size
			self.dmg_base = dmg_base
			self.dmg_type = dmg_type
			self.dmg_mod = dmg_mod
			self.Description = Description
	
	var all = [ActionsRow.new(magic_missile, "Magic Missile", 8, 10, 2, 2, 1, 3, 0, 1, 2, 2, 6, "Fires a small missile that deals (Intellect + 2) damage."), ActionsRow.new(buck, "Buck", 8, 10, 0, 1, 1, 1, 0, 1, 1, 1, 4, "Delivers a solid kick with the hind legs, dealing (Strength + 1) damage.")]
	var index = {magic_missile: 0, buck: 1}
	
	func get(id:String) -> ActionsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> ActionsRow:
		if idx < all.size():
			return all[idx]
		return null

class CutieMarks:

	const twilight := "twilight"
	const sunset := "sunset"
	const aj := "aj"

	class CutieMarksRow:
		var id := ""
		var name := ""
		
		func _init(id = "", name = ""):
			self.id = id
			self.name = name
	
	var all = [CutieMarksRow.new(twilight, "The Magic of Friendship"), CutieMarksRow.new(sunset, "Vengeful Sun"), CutieMarksRow.new(aj, "Honest Apple")]
	var index = {twilight: 0, sunset: 1, aj: 2}
	
	func get(id:String) -> CutieMarksRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> CutieMarksRow:
		if idx < all.size():
			return all[idx]
		return null

class Classes:

	const magic_student := "magic_student"
	const princess_protege := "princess_protege"
	const athlete := "athlete"

	class ClassesRow:
		var id := ""
		var name := ""
		
		func _init(id = "", name = ""):
			self.id = id
			self.name = name
	
	var all = [ClassesRow.new(magic_student, "Magic Student"), ClassesRow.new(princess_protege, "Princess Protege"), ClassesRow.new(athlete, "Athlete")]
	var index = {magic_student: 0, princess_protege: 1, athlete: 2}
	
	func get(id:String) -> ClassesRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> ClassesRow:
		if idx < all.size():
			return all[idx]
		return null

class ClassActionLearnsets:

	const magic_student := "magic_student"
	const princess_protege := "princess_protege"
	const athlete := "athlete"

	class ClassActionLearnsetsRow:
		var id := ""
		var lv0 := ""
		var lv3 := ""
		var lv6 := ""
		var lv9 := ""
		
		func _init(id = "", lv0 = "", lv3 = "", lv6 = "", lv9 = ""):
			self.id = id
			self.lv0 = lv0
			self.lv3 = lv3
			self.lv6 = lv6
			self.lv9 = lv9
	
	var all = [ClassActionLearnsetsRow.new(magic_student, "magic_missile", "", "", ""), ClassActionLearnsetsRow.new(princess_protege, "magic_missile", "", "", ""), ClassActionLearnsetsRow.new(athlete, "", "", "")]
	var index = {magic_student: 0, princess_protege: 1, athlete: 2}
	
	func get(id:String) -> ClassActionLearnsetsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> ClassActionLearnsetsRow:
		if idx < all.size():
			return all[idx]
		return null

class ClassTalentLearnsets:

	const magic_student := "magic_student"
	const princess_protege := "princess_protege"
	const athlete := "athlete"

	class ClassTalentLearnsetsRow:
		var id := ""
		var lv0 := ""
		var lv3 := ""
		var lv6 := ""
		var lv9 := ""
		
		func _init(id = "", lv0 = "", lv3 = "", lv6 = "", lv9 = ""):
			self.id = id
			self.lv0 = lv0
			self.lv3 = lv3
			self.lv6 = lv6
			self.lv9 = lv9
	
	var all = [ClassTalentLearnsetsRow.new(magic_student, "", ""), ClassTalentLearnsetsRow.new(princess_protege, "", ""), ClassTalentLearnsetsRow.new(athlete, "", "")]
	var index = {magic_student: 0, princess_protege: 1, athlete: 2}
	
	func get(id:String) -> ClassTalentLearnsetsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> ClassTalentLearnsetsRow:
		if idx < all.size():
			return all[idx]
		return null

class VariantActionLearnsets:

	const earth := "earth"
	const unicorn := "unicorn"
	const pegasus := "pegasus"

	class VariantActionLearnsetsRow:
		var id := ""
		var lv0 := ""
		var lv5 := ""
		var lv10 := ""
		var lv15 := ""
		var lv20 := ""
		var lv25 := ""
		var lv30 := ""
		var lv35 := ""
		
		func _init(id = "", lv0 = "", lv5 = "", lv10 = "", lv15 = "", lv20 = "", lv25 = "", lv30 = "", lv35 = ""):
			self.id = id
			self.lv0 = lv0
			self.lv5 = lv5
			self.lv10 = lv10
			self.lv15 = lv15
			self.lv20 = lv20
			self.lv25 = lv25
			self.lv30 = lv30
			self.lv35 = lv35
	
	var all = [VariantActionLearnsetsRow.new(earth, "buck"), VariantActionLearnsetsRow.new(unicorn, "buck"), VariantActionLearnsetsRow.new(pegasus, "buck")]
	var index = {earth: 0, unicorn: 1, pegasus: 2}
	
	func get(id:String) -> VariantActionLearnsetsRow:
		if index.has(id):
			return all[index[id]]
		return null

	func get_index(idx:int) -> VariantActionLearnsetsRow:
		if idx < all.size():
			return all[idx]
		return null

var identities := Identities.new()
var basestats := BaseStats.new()
var growths := Growths.new()
var actions := Actions.new()
var cutiemarks := CutieMarks.new()
var classes := Classes.new()
var classactionlearnsets := ClassActionLearnsets.new()
var classtalentlearnsets := ClassTalentLearnsets.new()
var variantactionlearnsets := VariantActionLearnsets.new()
