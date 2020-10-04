extends KinematicBody2D

onready var projectile_asset = preload("res://Projectile.tscn")

var velocity : Vector2 = Vector2()

var speed = 200

onready var sprite : Sprite = get_node("sprite_of_player")

var start_time = 0
var end_time = 0
var first_projectile = false;

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	sprite.rotation_degrees = 0


	
	if Input.is_action_pressed("spawn_projectile"):
		
		start_time = OS.get_ticks_msec()
		
		print("START_TIME: " + str(start_time))
		print("END_TIME: " + str(end_time))
		
		if(abs(end_time - start_time) > 100 or first_projectile == false):
			print("testing")
			first_projectile = true
			var new_projectile = projectile_asset.instance()
			
			var newPos = Vector2(position.x + (get_node("sprite_of_player").texture.get_size().x / 2), 
			position.y + (get_node("sprite_of_player").texture.get_size().y / 2)) # This here sets pos based on the previous X value.
			
			##########################
			
			new_projectile.position.x = newPos.x
			new_projectile.position.y = newPos.y
			
			new_projectile.linear_velocity.x = 800
			
			get_tree().get_root().add_child(new_projectile)
			
			end_time = OS.get_ticks_msec()
	
	
	
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
	
