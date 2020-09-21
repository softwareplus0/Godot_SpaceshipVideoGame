extends KinematicBody2D

var velocity : Vector2 = Vector2()

var speed = 200

onready var sprite : Sprite = get_node("sprite_of_player")

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	sprite.rotation_degrees = 0
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	
	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false
	
	if velocity.y < 0:
		if velocity.x >= 0:
			sprite.rotation_degrees = -45
		if velocity.x < 0:
			sprite.rotation_degrees = 45
		
	if velocity.y > 0:
		if velocity.x >= 0:
			sprite.rotation_degrees = 45
		if velocity.x < 0:
			sprite.rotation_degrees = -45
		
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
