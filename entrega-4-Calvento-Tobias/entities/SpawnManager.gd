extends Node

export (NodePath) var pathfinding:NodePath

func _ready():
	print(pathfinding.is_empty())
	if pathfinding.is_empty():
		return
		
	var pathfinder:PathfindAstar = get_node(pathfinding)
	if pathfinder == null:
		return
		
	for child in get_children():
		if child.get_class() != "TileMap":
			child.pathfinding = pathfinder
