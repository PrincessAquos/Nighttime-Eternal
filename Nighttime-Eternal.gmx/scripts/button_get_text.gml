///button_get_text(function)
var function = argument[0];

switch (function) {
    case "move":
        return "Move";
    case "stats":
        return "Check Stats";
    case "close":
        return "Close";
    case "actions":
        return "Actions";
    case "wait":
        return "Wait";
    default:
        return "Nothing";
}
