extends StaticBody2D

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, 0))
	if collision:
		print('mám tě!!!')
		self.owner._on_hand_catched()
