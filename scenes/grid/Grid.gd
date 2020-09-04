class_name Grid
extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	connect_to_signals()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func connect_to_signals() -> void:
	var entitys := get_tree().get_nodes_in_group("entitys")
	for node in entitys:
		var entity := node as Entity
		if entity:
			entity.connect("requested_move", self, "_on_requested_move")


func _on_requested_move(entity: Entity, movement_goal: Vector2) -> void:
	var cell_start = world_to_map(entity.position)
	var cell_target = cell_start + movement_goal
	
	# Insert movement decision making here
	var cell_end = cell_target
	
	entity.position = map_to_world(cell_end)
	entity.call("_movement_result", true)

