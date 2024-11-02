extends Control

func _ready():
	pass

# Function to start the game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/instructions.tscn")
