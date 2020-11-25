extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		$Panel.visible = !$Panel.visible
		$Panel/Label.visible = !$Panel/Label.visible
