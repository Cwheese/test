extends Control

var center : Vector2
@onready var node = $Control2

func _ready():
	#calculate center of screen
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
	
func _process(_delta):
	var tween = node.create_tween()
	#calculating vector between mouse and center, then taking only 10% value
	var offset = center - get_global_mouse_position() * 0.1
	# running tween to animate block position	
	tween.tween_property(node, "position",offset,1.0)
	
func _on_item_rect_changed() -> void:
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
	if node != null:
		node.global_position = center
