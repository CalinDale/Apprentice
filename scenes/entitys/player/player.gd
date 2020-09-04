class_name Player
extends Entity

var movement_goal := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("entitys")
	


func _input(event: InputEvent) -> void:
	if(is_my_turn):
		movement_goal = get_movement_goal()


# Replace with a signal response when it is my turn
func _physics_process(delta: float) -> void:
	_take_turn()


func _movement_result(success: bool) -> void:
	if success:
		print("I moved")
	else:
		print("bump")
	movement_goal = Vector2.ZERO


func _take_turn() -> void:
	if movement_goal:
		emit_signal("requested_move", self, movement_goal)


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
