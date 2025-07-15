extends CanvasLayer

var paused= false

func pause():
	paused = !paused
	
	if paused:
		get_tree().paused = true
		show()
	else:
		get_tree().paused = false
		hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		pause()
