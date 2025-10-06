extends StaticBody2D
var guard

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.ZERO:
		guard = "idle"
	pass
	
	
	play_anim(direction)
func play_anim(dir):
		if guard == "idle":
			$AnimatedSprite2D.play ("idle")
		pass
