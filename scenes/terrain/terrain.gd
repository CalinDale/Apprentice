#tool
#extends Resource
class_name Terrain
# A tile of terrain


#signal signal_name(parameter: Type)
#enum enum_name { VALUE }
#const CONST_NAME: Type
#export var var_name: Type
export var name: String
export var tile_index: int
export var has_collision: bool
export var blocks_sight: bool

#var public_variable: Type
#var _private_variable: Type
#onready var onready_variable: Type


func _init(p_name: String, p_tile_index: int, p_has_collision := false, p_blocks_sight := false) -> void:
	name = p_name
	tile_index = p_tile_index
	has_collision = p_has_collision
	blocks_sight = p_blocks_sight


#func public_method(arg: Type) -> Type:


#func _private_method(arg: Type) -> Type:
