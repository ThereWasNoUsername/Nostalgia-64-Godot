extends Node

export(NodePath) var target
export(String) var action
	
func _ready():
	var error = ""
	if(target):
		target = get_node(target)
	else:
		warn("target missing")
	if(!action):
		warn("action missing")
		
	pass

func _process(delta):
	if(Input.is_action_just_pressed(action)):
		target.onPressed()
	elif(Input.is_action_just_released(action)):
		target.onReleased()
	pass


export(bool) var printErrors = false;
export(bool) var printWarnings = true;
export(bool) var printInfo = true;
func warn(message):
	if(printErrors):
		printerr("" + get_path() + ">" + message)
	elif(printWarnings): print("" + get_path() + ">" + message)
	pass
func info(message):
	if(printInfo): print("" + get_path() + ">" + message)
	pass
