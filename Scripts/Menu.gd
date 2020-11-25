extends Node2D

func _ready():
	var global = get_node("/root/Global")
	global.Life = 3

func _on_play_pressed():
	$bg/AudioStreamPlayer.play()
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene('res://Scene/game.tscn')

func _on_exit_pressed():
	$bg/AudioStreamPlayer.play()
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().quit()
