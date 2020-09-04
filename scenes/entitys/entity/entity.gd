class_name Entity
extends Node2D
# DOCSTRING TEST BEEP BOOP

signal requested_move(entity, movement_goal)

var is_my_turn := true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("entitys")

# Replace with a signal response when it is my turn
#func _physics_process(delta: float) -> void:
#	pass


func _movement_result(success: bool) -> void:
	pass


func _take_turn() -> void:
	pass
