extends Reference

class_name SubMenuButtonFunction
	
var display_name:String
var function:FuncRef
	
func _init(display:String, instance:Object, funcname:String):
	display_name = display
	function = funcref(instance, funcname)
