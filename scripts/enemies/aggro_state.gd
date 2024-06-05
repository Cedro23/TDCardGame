extends State
class_name AggroState

func process(_delta: float):
	if enemy.target != null && can_move:
		var direction_to_target = (enemy.target.position - enemy.global_position).normalized()
		enemy.velocity = direction_to_target * enemy.speed
		enemy.move_and_slide()

		if enemy.target_in_range():
			transitioned.emit("attack")