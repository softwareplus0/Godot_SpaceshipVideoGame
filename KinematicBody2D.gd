extends KinematicBody2D

var velocity : Vector2 = Vector2()
var speed = 400

func _physics_process(delta):
	velocity.x = speed
	velocity = move_and_slide(velocity, Vector2.UP)
