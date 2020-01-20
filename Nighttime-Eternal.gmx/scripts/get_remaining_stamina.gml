///get_remaining_stamina(moveTile, argPony, argStamina)
// Return remaining stamina of such a move, if the moveTile is traversible
// If the movement is not valid, returns -1

var moveTile = argument[0];
var argPony = argument[1];
var argStamina = argument[2];

if(is_valid_move(moveTile, argPony)) {
    argStamina = remaining_stamina(moveTile, argPony, argStamina);
}
else {
    argStamina = -1;
}
return argStamina;
