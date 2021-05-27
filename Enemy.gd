extends Character

class_name Enemy

var inputDirection: float = -1.0

var isOnWorld: bool = true
var isTouchingWall: bool = false


func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -enemySpeed.x


func _on_StompDetector_body_entered(body: KinematicBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	queue_free()#deletes node



func _on_FieldArea_area_exited(area: Area2D) -> void:
	if area.global_position.x > get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	if area.global_position.x < get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_FieldArea2_area_exited(area: Area2D) -> void:
	if area.global_position.x > get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	if area.global_position.x < get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _on_FieldArea1_area_exited(area: Area2D) -> void:
	if area.global_position.x > get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	if area.global_position.x < get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func _physics_process(_delta: float) -> void: #main physics process function
	_velocity.y += gravity * get_physics_process_delta_time()
	if is_on_wall(): #If in contact with a wall or barrier
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_FieldArea3_area_exited(area: Area2D) -> void:
	if area.global_position.x < get_node("Alien").global_position.x:
		_velocity.x *= -1.0
	else : _velocity.x *=-1.0
