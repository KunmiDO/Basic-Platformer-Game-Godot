extends Item

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

func _physics_process(_delta: float) -> void:
	_itemVelocity = Vector2.ZERO
	_itemVelocity.y = _itemgravity * get_physics_process_delta_time()


func _on_Carrot_body_entered(body: Node) -> void:
	anim_player.play("fade_out")
