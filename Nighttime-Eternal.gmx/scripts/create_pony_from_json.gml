/// create_pony_from_json(argX, argY, pony_name)

var argX = argument[0];
var argY = argument[1];
var pony_name = argument[2];

var pony = instance_create(argX, argY, obj_Pony);
with(pony) {
    var ponyMap = get_map_from_json(pony_name + ".json")
    
    identity = ponyMap[? "identity"];
    stats = ponyMap[? "stats"];
    hp = stats[? "maxHP"];
    stamina = stats[? "maxStamina"];
    cutieMark = ponyMap[? "cutieMark"];
    class = ponyMap[? "defaultClass"];
    race = ponyMap[? "race"];
    attacks = pony_get_attacks(class, cutieMark, race)
}

