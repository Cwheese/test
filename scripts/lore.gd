extends CanvasLayer

func _ready():
	pass 
	

func _on_bck_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
