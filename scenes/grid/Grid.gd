class_name Grid
extends TileMap
# The world grid, manages all map contents and movement


#signal signal_name(parameter: Type)
#enum enum_name { VALUE }
#const CONST_NAME: Type
#export var var_name: Type
export var map_size: Vector2

#var public_variable: Type
#var _private_variable: Type
# Need to redo terrain management
var _terrains: Dictionary = {
	0: Terrain.new("stone_wall", 0, true, true),
	1: Terrain.new("empty", 1, false, false),
}

var _terrain_map: Array = [[]]
#onready var onready_variable: Type


# Constructor
#func _init(args).(parent_args) -> void:


# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_to_signals()
	_build_terrain_map()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Called whenever there is an input event
#func _input(event: InputEvent) -> void:


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:


# Called every physics step if physics is enabled. 'delta' is constant
#func _physics_process(delta: float) -> void:


#func public_method(arg: Type) -> Type:


#func _private_method(arg: Type) -> Type:
func _connect_to_signals() -> void:
	var entitys := get_tree().get_nodes_in_group("entitys")
	for node in entitys:
		var entity := node as Entity
		if entity:
			entity.connect("requested_move", self, "_on_requested_move")


func _build_terrain_map() -> void:
	_terrain_map.resize(map_size.x)
	for x in range(0, map_size.x):
		_terrain_map[x] = []
		_terrain_map[x].resize(map_size.y)
		for y in range(0, map_size.y):
			var terrain_index = get_cell(x,y)
			if terrain_index != -1:
				var terrain: Terrain = _terrains[terrain_index]
				_terrain_map[x][y] = terrain
				print(terrain.name)

func _on_requested_move(entity: Entity, movement_goal: Vector2) -> void:
	var cell_start = world_to_map(entity.position)
	var cell_target = cell_start + movement_goal
	
	# Insert movement decision making here
	var target_terrain: Terrain = _terrain_map[cell_target.x][cell_target.y]
	print(target_terrain.name)
	
	if(target_terrain.has_collision):
		var cell_end = cell_start
		entity.call("_movement_result", false)
	else:
		var cell_end = cell_target
		entity.position = map_to_world(cell_end)
		entity.call("_movement_result", true)
