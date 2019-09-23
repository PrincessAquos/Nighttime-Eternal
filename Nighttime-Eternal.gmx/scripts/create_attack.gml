///create_attack(stamCost, damage, rangeType, range, effect)
var stamCost = argument[0];
var damage = argument[1];
var rangeType = argument[2];
var range = argument[3];
var effect = argument[4];

newAttack = ds_list_create();
ds_list_add(newAttack, stamCost, damage, rangeType, range, effect);
return newAttack;
