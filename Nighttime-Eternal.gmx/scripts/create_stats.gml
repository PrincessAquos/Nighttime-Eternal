///create_stats(level, xp, hp, stamina, resource, attack, defense, intellect, resilience, agility, luck, vision)
var argHP = argument[0];
var argStamina = argument[1];

var stats = instance_create(0, 0, obj_char_stats);
init_stats(stats, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
return stats;
