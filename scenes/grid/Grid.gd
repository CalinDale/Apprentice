extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var entitys := get_tree().get_nodes_in_group("entitys")
	for node in entitys:
		node.connect("requested_move", self, "_on_requested_move")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_requested_move(entity: PlayerBrain, movement_goal: Vector2) -> void:
	
	var cell_start = world_to_map(entity.position)
	var cell_target = cell_start + movement_goal
	
	# Insert movement decision making here
	var cell_end = cell_target
	
	entity.position = map_to_world(cell_end)
	entity.call("movement_result", true)

