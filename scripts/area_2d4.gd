extends Area2D
var entered 

func _on_body_entered(body: CharacterBody2D) -> void:
	pass 

func _on_body_exited(body:) -> void:
	entered = false 

	if entered != null:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/npc_1_house.tscn")
