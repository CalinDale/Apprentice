class_name Player
extends Entity
# The Player-controlled entity.

#signal signal_name(parameter: Type)
#enum enum_name { VALUE }
#const CONST_NAME: Type
#export var var_name: Type
#var public_variable: Type
#var _private_variable: Type
var _movement_goal := Vector2.ZERO
#onready var onready_variable: Type


# Constructor
#func _init(args).(parent_args) -> void:


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("entitys")
	


#func public_method(arg: Type) -> Type:


func _input(event: InputEvent) -> void:
	if(_is_my_turn):
		_movement_goal = _get_movement_goal()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:


# Replace with a signal response when it is my turn
# Called every physics step if physics is enabled. 'delta' is constant
func _physics_process(delta: float) -> void:
	_take_turn()


#func public_method(arg: Type) -> Type:
func _movement_result(success: bool) -> void:
	if success:
		print("I moved")
	else:
		print("bump")
	_movement_goal = Vector2.ZERO


func _take_turn() -> void:
	if _movement_goal:
		emit_signal("requested_move", self, _movement_goal)


#func _private_method(arg: Type) -> Type:
func _get_movement_goal() -> Vector2:
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
