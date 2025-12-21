extends NodeState

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var icicle_beast: CharacterBody2D = $"../.."
@onready var snowball:PackedScene=preload("res://Scenes/objects/snowball.tscn")

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	animated_sprite_2d.play("death")
	await animated_sprite_2d.animation_finished
	for i in icicle_beast.level:
		var instance = snowball.instantiate()
		instance.position=get_random_spawn(icicle_beast.position,32)
		get_tree().current_scene.add_child(instance)
	icicle_beast.queue_free()

func _on_exit() -> void:
	pass

func get_random_spawn(center: Vector2, radius: float) -> Vector2:
	var angle = randf() * TAU
	var offset = Vector2(cos(angle), sin(angle)) * radius
	return center + offset
