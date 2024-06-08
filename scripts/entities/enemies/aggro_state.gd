extends State
class_name AggroState

func enter():
	entity.nav_timer.start()

func exit():
	entity.nav_timer.stop()

func process_physics(_delta: float):
	if entity.target != null && can_move:
		# var dir = (entity.target.position - entity.global_position).normalized()
		var dir = entity.to_local(entity.nav_agent.get_next_path_position()).normalized()
		entity.velocity = dir * entity.speed
		entity.move_and_slide()

		if entity.target_in_range():
			transitioned.emit("attack")

func make_path() -> void:
	if entity.target != null:
		entity.nav_agent.target_position = entity.target.global_position


func _on_navigation_timer_timeout():
	make_path()
