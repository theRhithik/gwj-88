extends CharacterBody2D

#movement code refactor
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 100
	move_and_slide()


#var movement_speed = 60.0
#
#func _physics_process(_delta: float) -> void:
	#movement()
	#
#this function is defining the character movement. 
#we are listening for Inputs to determine which direction the character moves
#func movement():
	#var x_move = Input.get_action_strength("right") - Input.get_action_strength("left")
	#var y_move = Input.get_action_strength("down") - Input.get_action_strength("up")
	#var move = Vector2(x_move, y_move)
	#velocity = move.normalized() * movement_speed
	#move_and_slide()
	
