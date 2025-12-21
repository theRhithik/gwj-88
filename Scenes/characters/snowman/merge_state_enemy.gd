extends NodeState

##Pass-through for  proccess function
func _on_process(_delta : float) -> void:
	pass

##Pass-through for physics proccess function
func _on_physics_process(_delta : float) -> void:
	pass

##Logic goes here to determining when to transistion states
##call transition.emit("StateNodeName") to specify new state
func _on_next_transitions() -> void:
	pass

##Run when first entering the state
func _on_enter() -> void:
	print('merging')

##Last thing run before transitioning to next state
func _on_exit() -> void:
	pass
