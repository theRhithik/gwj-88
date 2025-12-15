extends NodeState

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var icicle_beast: CharacterBody2D = $"../.."


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	await get_tree().create_timer(3).timeout
	icicle_beast.queue_free()


func _on_enter() -> void:
	animated_sprite_2d.play("death")


func _on_exit() -> void:
	pass
