extends Control

# Example for main_menu.tscn script
func _ready():
	AudioPlayer._play_music_level()	# Play background music
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.

func _on_lore_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lore.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/npc_1_house.tscn")
	AudioPlayer.stop()
	
