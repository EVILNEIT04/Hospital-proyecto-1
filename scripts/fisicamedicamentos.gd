extends Area2D

var arrastrando = false
var offset = Vector2.ZERO

func _input_event(viewport, event, shape_idx):

	if event is InputEventScreenTouch:
		
		if event.pressed:
			arrastrando = true
			offset = global_position - event.position
		
		else:
			arrastrando = false


func _process(delta):

	if arrastrando:
		global_position = get_global_mouse_position() + offset
