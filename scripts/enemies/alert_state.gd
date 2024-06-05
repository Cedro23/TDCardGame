extends State
class_name AlertState

func enter():
	enemy._attack_timer.wait_time = enemy._attack_cooldown

func process(_delta:float):
	if enemy._target == null:
		enemy._target = get_target()
	if enemy._target != null:
		transitioned.emit("aggro")

func get_target():
	var closest_building: Building = null
	var buildings = get_tree().get_nodes_in_group("Building")

	for b in buildings:
		var distance = enemy.position.distance_to(b.position)
		if closest_building == null or distance < closest_building.position.distance_to(b.position):
			closest_building = b

	return closest_building