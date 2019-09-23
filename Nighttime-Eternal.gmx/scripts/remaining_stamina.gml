///remaining_stamina(moveTile, argStamina)
// Returns the stamina that will remain after traveling to the given location
// Returns -1 if the given location is not able to be moved to

var moveTile = argument[0];
var argPony = argument[1];
var argStamina = argument[2];

return argStamina - moveTile.stamCost;
