extends Area2D

var entered = false


func _on_body_entered(body: CharacterBody2D):
		entered = true 

func _on_body_exited(body):
		entered = false 

		if entered != null:
			TransitionScreen.transition()
			await TransitionScreen.on_transition_finished
			get_tree().change_scene_to_file("res://scenes/world_3_(castle).tscn")
