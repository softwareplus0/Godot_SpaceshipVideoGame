extends Node2D

onready var flagPacked = preload("res://Sprite.tscn")
onready var screenSize = get_viewport().get_visible_rect().size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	while(1) :
		var flagPrev = Vector2() # Give here a good starting value.
		var flag = flagPacked.instance()
		
		var newPos = Vector2(screenSize.x, randi() % int(screenSize.y)) # This here sets pos based on the previous X value.
		
		##########################
		
		flag.position.x = newPos.x
		flag.position.y = newPos.y
		flagPrev = newPos #Update the previous in seach flag spawn.
		
		get_tree().get_root().add_child(flag)
		yield(get_tree().create_timer(1), "timeout")
