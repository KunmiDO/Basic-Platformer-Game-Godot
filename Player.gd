extends Character

class_name Player

export var healthScore: int = 100
export var scoreCount: int = 0

export var stomp_impulse: float = 500.0

func _on_EIDetection_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EIDetection_body_entered(body: Enemy) -> void:
	queue_free()


func _physics_process(_delta: float) -> void:
	var direction:= get_direction()
	_velocity = get_movement_velocity(_velocity, speed, direction)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


func get_direction()-> Vector2:
	return Vector2(
		Input.get_action_strength("move_right")- Input.get_action_strength("move_left"),
		 -1.0 if Input.is_action_just_pressed("_Jump") and is_on_floor() else 1.0
	)

func get_movement_velocity(
	linear_velocity: Vector2, 
	speed: Vector2, 
	direction:Vector2
	)-> Vector2:
	var outputvelo: = linear_velocity
	outputvelo.x = speed.x * direction.x
	outputvelo.y +=gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		outputvelo.y = speed.y * direction.y
	return outputvelo

func increase_score_count(_scoreCount: int)->void:
	var _new_score = _scoreCount
	_new_score +=5

func calculate_stomp_velocity(linear_velocity: Vector2,
new_impulse: float
)-> Vector2:
	var _velocity:= linear_velocity
	_velocity.y = -new_impulse
	return _velocity

#func _on_EIDetection_area_entered(area: Area2D) -> void:





