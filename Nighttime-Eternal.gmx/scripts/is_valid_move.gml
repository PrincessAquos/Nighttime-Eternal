///is_valid_move(moveTile, argPony)
// Returns true if it is valid for the given pony to move to the given moveTile
// Returns false if not

var moveTile = argument[0];
var argPony = argument[1];

if (moveTile == noone) return false;

var invalid_checks;
var req_to_be_valid;
invalid_checks[0] = moveTile.isWall;
//invalid_checks[2] = moveTile.isFlyOnly && pony is not flying

for(var i = 0; i < 1; i++) {
    if (invalid_checks[i]) {
        return false;
    }
} 

return true;
