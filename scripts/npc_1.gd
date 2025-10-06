extends StaticBody2D
var npc_1 

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.ZERO:
		npc_1 = "idle"
	pass
	
	
	play_anim(direction)
func play_anim(dir):
		if npc_1 == "idle":
			$AnimatedSprite2D.play ("idle")
		pass
