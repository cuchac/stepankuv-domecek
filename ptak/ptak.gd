extends StaticBody2D

var velocity: Vector2 = Vector2(100, 0)

func _ready():
	self.randomize()

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func randomize():
	velocity.x = sign(velocity.x) * randf_range(100,300)
	velocity.y = sign(velocity.x) * randf_range(100,200)
	var next_change = randf_range(0.5,2)
	
	$Timer.start(next_change)

func _on_timer_timeout() -> void:
	self.randomize()
