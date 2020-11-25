extends KinematicBody2D

var speed = 100
var pos = Vector2()

var side = 1

func _physics_process(delta):
	$AnimatedSprite.play("default")
	pos.x = speed * side
	
	move_and_slide(pos)
	
	if is_on_wall():
		side = side * -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
