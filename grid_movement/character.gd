extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, delta*1000)
	else:
		velocity.x = move_toward(velocity.x, 0, delta*1000)
		
	direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = move_toward(velocity.y, direction * SPEED, delta*1000)
	else:
		velocity.y = move_toward(velocity.y, 0, delta*1000)

	move_and_slide()
