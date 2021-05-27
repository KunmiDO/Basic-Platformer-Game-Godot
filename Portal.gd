tool
extends Area2D

export var next_scene : PackedScene

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Portal_body_entered(body: KinematicBody2D) -> void:
	_next_level()


func _next_level() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)

func _get_configuration_warning() -> String:
	return "Error" if not next_scene else ""
