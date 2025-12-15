extends NodeState

@export var character: NonPlayableCharacter
@export var attack_collision_shape: CollisionShape2D


@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

func _ready() -> void:
	attack_collision_shape.disabled=true
	attack_collision_shape.position=Vector2.ZERO


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("walk")

func _on_enter() -> void:
	animated_sprite_2d.play("attack")
	animated_sprite_2d.flip_h=character.facing>0
	animated_sprite_2d.scale=animated_sprite_2d.scale*2
	
	attack_collision_shape.scale = attack_collision_shape.scale*2
	attack_collision_shape.disabled=false
	print(character.name,"playing attack animation")
	#await  animated_sprite_2d.animation_finished
	#await get_tree().create_timer(3.0).timeout#placeholder until attack animation is present
	

func _on_exit() -> void:
	animated_sprite_2d.scale=Vector2.ONE
	attack_collision_shape.scale =Vector2.ONE
	attack_collision_shape.disabled=true
