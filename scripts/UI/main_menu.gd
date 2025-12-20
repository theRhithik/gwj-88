extends Control

var game = "res://Scenes/world.tscn"
#var settings = 

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	print("Play button pressed")
	var _game = get_tree().change_scene_to_file(game)

func _on_settings_pressed() -> void:
	print("Settings button pressed")


func _on_exit_pressed() -> void:
	print("Exit button pressed")
	get_tree().quit()
