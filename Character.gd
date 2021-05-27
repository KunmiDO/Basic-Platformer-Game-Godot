extends KinematicBody2D
class_name Character


const FLOOR_NORMAL:= Vector2.UP

export var speed:= Vector2(300.0, 1000.0)
export var enemySpeed:= Vector2(150.0, 1000.0)
export var gravity:= 3000.0

var _velocity: = Vector2.ZERO
