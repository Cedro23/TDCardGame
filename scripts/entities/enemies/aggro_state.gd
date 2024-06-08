extends State
class_name AggroState

func process_physics(_delta: float):
	if entity.target != null && can_move:
		var direction_to_target = (entity.target.position - entity.global_position).normalized()
		entity.velocity = direction_to_target * entity.speed
		entity.move_and_slide()

		if entity.target_in_range():
			transitioned.emit("attack")