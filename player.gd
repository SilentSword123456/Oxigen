extends CharacterBody2D

func _ready() -> void:
	$AnimatedSprite2D.play("Idle")
	
const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _chose_animation() -> void:
	if is_zero_approx(velocity.x) && is_zero_approx(velocity.y):
		$AnimatedSprite2D.play("Idle")
	elif !is_on_floor():
		if velocity.y>0:
			$AnimatedSprite2D.play("Fall")
		else:
			$AnimatedSprite2D.play("Jump")
	else:
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = velocity.x < 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	_chose_animation()
