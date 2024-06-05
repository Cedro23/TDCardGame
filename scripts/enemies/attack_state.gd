extends State
class_name AttackState

var can_attack: bool = true

func enter():
	pass

func process(_delta):
	if can_attack:
		can_attack = false
		enemy.attack()
		enemy._attack_timer.start()

func _on_attack_range_body_exited(body:Building):
	if body == enemy._target:
		enemy._target = null
		transitioned.emit("alert")

func _on_attack_timer_timeout():
	can_attack = true
