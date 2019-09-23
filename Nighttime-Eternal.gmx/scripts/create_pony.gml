/// create_pony(argX, argY, argIdentity, argStats, argCutieMarks, argClass)

var argX = argument[0];
var argY = argument[1];
var argIdentity = argument[2]; 
var argStats = argument[3];
var argCutieMark = argument[4];
var argClass = argument[5];
/* 
[name, race, mane, tail, cutieMark, bodyColors(arr), maneColors(arr), tailColors(arr)] 
*/
                             //   0    1    2    3    4    5    6    7    8    9
//var baseStats = argument[3]; // [hp, stam, spd, str, def, int, res, agi, lck]
//var realStats = argument[4]; // [hp, stam, spd, str, def, int, res, agi, lck, lvl]
//var growths = argument[5];   // [hp, stam, spd, str, def, int, res, agi, lck]

var pony = instance_create(argX, argY, obj_Pony);
with(pony) {
    identity = argIdentity
    stats = argStats
    hp = stats.maxHP
    //maxHP = realStats[0];
    //hp = maxHP;
    stamina = stats.maxStamina
    //maxStamina = realStats[1];
    //stamina = maxStamina;
    //spd = realStats[2];
    cutieMark = argCutieMark
    class = argClass
    attacks = pony_get_attacks(class, cutieMark, identity.race)
}

return pony;
