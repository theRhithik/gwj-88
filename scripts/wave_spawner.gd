extends Node

var enemy_scene:PackedScene=preload("res://Scenes/characters/icicle_beast/icicle_beast.tscn")
var enemies_in_wave:int
@export_range(0.0,180.0,1.0,"suffix:s") var wave_time:float=30
var player:CharacterBody2D
@export_range(50,1000,10,"suffix:px") var spawn_distance_from_player:float=100.0
@export var waves:int = 10

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	call_deferred("wave_machine")


func wave_machine():
	for wave in waves:
		enemies_in_wave = wave+2
		print("wave: ",wave)
		for enemy in enemies_in_wave:
			var instance:NonPlayableCharacter = enemy_scene.instantiate()
			var angle = randf()*TAU
			instance.position = player.position+Vector2(cos(angle),sin(angle))*spawn_distance_from_player
			instance.target = player
			get_tree().current_scene.add_child(instance)
			print(instance," spawned at ",instance.position)
		await get_tree().create_timer(wave_time).timeout
		
