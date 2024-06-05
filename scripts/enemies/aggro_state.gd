extends State
class_name AggroState

#? Is it supposed to be here ?
func process(delta):
	if enemy._target != null:
		if enemy.state_machine.can_move():
			enemy.position = enemy.position.move_toward(enemy._target.position, enemy._speed * delta)

func _on_attack_range_body_entered(body: Node2D):
	if body == enemy._target:
		transitioned.emit("attack")
