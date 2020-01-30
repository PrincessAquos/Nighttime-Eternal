///game_set_state(state)
// Sets the game state to the given state
state = argument[0]

switch state {
    case "selecting":
    case "menu":
    case "movement":
    case "action":
    case "animating":
        show_debug_message("Game state changed to: " + state);
        global.game.state = state
        break;
    case "cutscene":
    case "waiting_for_other_player":
    case "react_target":
    case "react_aoe":
        show_debug_message("Provided game state - " + state + " - is not yet implemented. State will be changed anyways.")
        global.game.state = state
        break;
    default:
        show_debug_message("Tried to change game to invalid state: " + state);
}
