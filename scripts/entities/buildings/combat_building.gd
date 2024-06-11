extends CombatEntity
class_name CombatBuilding

func get_target():
	var closest_entity: Entity = null
	var shortest_distance: float
	var overlapping_bodies = attack_range.get_overlapping_bodies()

	for b in overlapping_bodies:
		var distance = position.distance_to(b.position)
		if closest_entity == null or distance < shortest_distance:
			closest_entity = b
			shortest_distance = distance

	return closest_entity