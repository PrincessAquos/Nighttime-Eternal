///create_pony_identity(argName, argRace, argMane, argTail, argAccessory, argBodyPalette)
var argName = argument[0]
var argRace = argument[1]
var argMane = argument[2]
var argTail = argument[3]
var argAccessory = argument[4]
var argBodyPalette = argument[5]

var identity = instance_create(0, 0, obj_pony_identity);
with (identity) {
    name = argName;
    race = argRace;
    mane = argMane;
    tail = argTail;
    accessory = argAccessory;
    bodyPalette = argBodyPalette;
}

return identity;
