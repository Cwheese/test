extends CharacterBody2D

var speed = 150
var player_1 
@onready var actionable_finder: Area2D = $Direction/ActionableFinder

		
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction == Vector2.ZERO:
		player_1 = "idle"
	else:
		player_1 = "walk"
		
# Calculate the velocity by scaling the direction by the speed
	velocity = direction * speed

		# Normalize the velocity to ensure it has magnitude 1 (just direction) and then scale by speed
	velocity = velocity.normalized() * speed
	move_and_slide()
	
	play_anim(direction)
func play_anim(dir):
		if player_1 == "idle":
			$AnimatedSprite2D.play ("idle")
		elif player_1 == "walk":
			if dir.x == 1:
				$AnimatedSprite2D.play ("e-walk")
			elif dir.x == -1:
				$AnimatedSprite2D.play ("w-walk")
			elif dir.y == 1:
				$AnimatedSprite2D.play ("s-walk")
			elif dir.y == -1:
				$AnimatedSprite2D.play ("n-walk")
				
			if dir.x > 0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play ("ne-walk")
			elif dir.x > 0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play ("se-walk")
			elif dir.x < -0.5 and dir.y > 0.5:
				$AnimatedSprite2D.play ("sw-walk")
			elif dir.x < -0.5 and dir.y < -0.5:
				$AnimatedSprite2D.play ("nw-walk")
				
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
