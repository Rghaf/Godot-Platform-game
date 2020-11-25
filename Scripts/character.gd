extends KinematicBody2D

var pos = Vector2()

var grav = 20
var speed = 130

func _physics_process(delta):
	if Input.is_action_pressed("d"):
		pos.x += speed
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("a"):
		pos.x -= speed
		$AnimatedSprite.play("move")
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_released("d") or Input.is_action_just_released("a"):
		$AnimatedSprite.play("nomove")
	if Input.is_action_pressed("w") and is_on_floor():
		pos.y = -730
	
	pos.y += grav
	
	pos = move_and_slide(pos,Vector2.UP)
	
	pos.x = lerp(pos.x,0,0.5)
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		var global = get_node("/root/Global")
		global.Life -= 1
