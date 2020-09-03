class_name Player
extends Node2D

signal decided_move

const CELL_SIZE = 64

var movement_goal := Vector2.ZERO
var is_my_turn := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

func _input(event: InputEvent) -> void:
	if(is_my_turn):
		movement_goal = get_movement_goal()


func _physics_process(delta: float) -> void:
	take_turn()


func take_turn() -> void:
	if movement_goal:
		handle_movement()


func handle_movement() -> bool:
	print(movement_goal)
	position += movement_goal * CELL_SIZE
	movement_goal = Vector2.ZERO
	return true


func get_movement_goal() -> Vector2:
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("move_north"):
		direction.y -= 1
	if Input.is_action_pressed("move_south"):
		direction.y += 1
	if Input.is_action_pressed("move_west"):
		direction.x -= 1
	if Input.is_action_pressed("move_east"):
		direction.x += 1
	if Input.is_action_pressed("move_northwest"):
		direction.y -= 1
		direction.x -= 1
	if Input.is_action_pressed("move_northeast"):
		direction.y -= 1
		direction.x += 1
	if Input.is_action_pressed("move_southwest"):
		direction.y += 1
		direction.x -= 1
	if Input.is_action_pressed("move_southeast"):
		direction.y += 1
		direction.x += 1
	
	direction.y = clamp(direction.y, -1, 1)
	direction.x = clamp(direction.x, -1, 1) 
	return direction
