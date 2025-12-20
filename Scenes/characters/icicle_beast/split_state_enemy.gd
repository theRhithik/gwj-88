extends NodeState

@onready var sub_monster:PackedScene=preload("res://Scenes/characters/icicle_beast/icicle_beast.tscn")
@onready var icicle_beast: CharacterBody2D = $"../.."
var spawn_count:int = 1
	
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
	for i in spawn_count:
		var instance=sub_monster.instantiate()
		instance.level = icicle_beast.level - 1
		instance.position = icicle_beast.position+Vector2(randf_range(-50,50),randf_range(-50,50))
		instance.target=icicle_beast.target
		instance.maxHealth = icicle_beast.maxHealth-1
		instance.speed = icicle_beast.speed+2
		instance.hitDamage = icicle_beast.hitDamage/2
		instance.scale = icicle_beast.scale/2
		instance.merge_distance = icicle_beast.merge_distance/2
		get_tree().current_scene.add_child(instance)
		instance.start_cooldown()
	transition.emit("Death")
		
##Last thing run before transitioning to next state
func _on_exit() -> void:
	pass
	
