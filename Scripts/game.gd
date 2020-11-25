extends Node2D

const save_loacation = "user://data.json"
var scene = preload("res://Scene/character.tscn")
var details = {
	"Coin": 0,
}

func _ready():
	var characrter = scene.instance()
	add_child(characrter)
	
func _process(delta):
	var global = get_node("/root/Global")
	loading()
	$CanvasLayer/Panel/coin_label.text = str(details.Coin)
	$CanvasLayer/Panel/life_label.text = str(global.Life)
	checkLife()
	
func loading():
	var file = File.new()
	if file.file_exists(save_loacation):
		file.open(save_loacation, File.READ)
		var data = parse_json(file.get_as_text())
		details = data
		
func checkLife():
	var global = get_node("/root/Global")
	if global.Life < 1:
		get_tree().change_scene('res://Scene/Menu.tscn')
