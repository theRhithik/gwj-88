extends NodeState

@export var character: NonPlayableCharacter

@onready var attack_collision_shape: CollisionShape2D = $"../../HitboxArea/CollisionShape2D"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func _ready() -> void:
	attack_collision_shape.set_deferred("disabled",true)


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing()and character.currentHealth>0:
		transition.emit("walk")
	if character.currentHealth<=0:
		transition.emit("death")

func _on_enter() -> void:
	animated_sprite_2d.play("attack")
	animated_sprite_2d.flip_h=character.facing>0
	if character.facing<0:
		animated_sprite_2d.flip_h=true
		attack_collision_shape.position.x= -200
	else:
		animated_sprite_2d.flip_h=false
		attack_collision_shape.position.x= 200
	attack_collision_shape.set_deferred("disabled",false)
	print(character,"playing attack animation")
	#await  animated_sprite_2d.animation_finished
	#await get_tree().create_timer(3.0).timeout#placeholder until attack animation is present
	

func _on_exit() -> void:
	attack_collision_shape.set_deferred("disabled",true)
