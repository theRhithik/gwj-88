extends NodeState

@export var character: NonPlayableCharacter
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var collision_shape_2d: CollisionShape2D = $"../../CollisionShape2D"
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"

@export var attack_distance:float=40
var target:Node2D

func _ready() -> void:
	target = character.target
	navigation_agent_2d.target_position = target.global_position
	

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	navigation_agent_2d.target_position = target.global_position
	var target_direction: Vector2 = navigation_agent_2d.get_next_path_position() - character.global_position
	character.velocity = target_direction.normalized()*character.speed
	character.facing=target_direction.x
	animated_sprite_2d.flip_h = target_direction.x>0
	character.move_and_slide()


func _on_next_transitions() -> void:
	if character.currentHealth<=0 and character.level==1:
		character.velocity=Vector2.ZERO
		transition.emit("Death")
	
	if navigation_agent_2d.distance_to_target() <= attack_distance:
		character.velocity = Vector2.ZERO
		transition.emit("Attack")

	if character.currentHealth<=0 and character.level>1:
		character.velocity=Vector2.ZERO
		transition.emit("Split")
		
	#TODO transition.emit("Merge")

func _on_enter() -> void:
	animated_sprite_2d.play("walk")
	audio_stream_player_2d.play()


func _on_exit() -> void:
	animated_sprite_2d.stop()
	audio_stream_player_2d.stop()


func _on_hitbox_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
