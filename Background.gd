extends ColorRect

onready var screenSize = get_viewport().get_visible_rect().size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.rect_size.x = screenSize.x
	self.rect_size.y = screenSize.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
