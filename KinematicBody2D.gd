extends RigidBody2D

var velocity : Vector2 = Vector2()

func _physics_process(delta):
	self.velocity.x = velocity.x

