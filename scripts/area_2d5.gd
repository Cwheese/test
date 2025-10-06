extends Area2D

var entered

func _on_body_entered(body: CharacterBody2D) -> void:
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	entered = false 

	if entered != null:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://scenes/inside_castle.tscn")
