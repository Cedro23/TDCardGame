extends Enemy
class_name BasicEnemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if target == null:
		target = get_target()
		if target != null:
			target.destroyed.connect(_on_target_destroyed)
	

func get_target():
	var closest_building: Building = null
	var buildings = get_tree().get_nodes_in_group("Building")

	for b in buildings:
		var distance = position.distance_to(b.position)
		if closest_building == null or distance < closest_building.position.distance_to(b.position):
			closest_building = b

	return closest_building

func _on_target_destroyed():
	target.destroyed.disconnect(_on_target_destroyed)
	target = null
