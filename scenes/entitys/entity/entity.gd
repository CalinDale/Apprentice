class_name Entity
extends Node2D
# Any object on the map


#signal signal_name(parameter: Type)
signal requested_move(entity, movement_goal)
#enum enum_name { VALUE }
#const CONST_NAME: Type
#export var var_name: Type
#var public_variable: Type
#var _private_variable: Type
var _is_my_turn := true
#onready var onready_variable: Type


# Constructor
#func _init(args).(parent_args) -> void:


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("entitys")

# Called whenever there is an input event
#func _input(event: InputEvent) -> void:


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:


# Called every physics step if physics is enabled. 'delta' is constant
#func _physics_process(delta: float) -> void:


#func public_method(arg: Type) -> Type:


#func _private_method(arg: Type) -> Type:
func _movement_result(success: bool) -> void:
	pass


func _take_turn() -> void:
	pass
