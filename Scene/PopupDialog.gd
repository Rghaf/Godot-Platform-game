extends PopupDialog

func _on_winArea_body_entered(body):
	if body.name == 'player':
		popup()
		yield(get_tree().create_timer(0.8), "timeout")
		get_tree().change_scene("res://Scene/Menu.tscn")
