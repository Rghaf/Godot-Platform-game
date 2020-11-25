extends AnimatedSprite

const save_loacation = "user://data.json"

var details = {
	"Coin": 0,
	"Life": 3,
}

func _ready():
	$".".play("coin-anim")

func _on_Area2D_body_entered(body):
	if body.name == "player":
		loading()
		details.Coin += 1 # ==> Coin = Coin + 1
		saving()
		queue_free()
		
func saving():
	var file = File.new()
	file.open(save_loacation, File.WRITE)
	file.store_string(to_json(details))
	file.close()

func loading():
	var file = File.new()
	if file.file_exists(save_loacation):
		file.open(save_loacation, File.READ)
		var data = parse_json(file.get_as_text())
		details = data
		
