extends State
class_name AttackState

var can_attack: bool = false

func enter():
	enemy.attack_timer.start()


func process(_delta):
	if enemy.target == null or not target_in_range():
		transitioned.emit("alert")
	if can_attack:
		can_attack = false
		attack()
		enemy.attack_timer.start()

func attack():
	enemy.target.take_damage(enemy.attack_damage)

func _on_attack_timer_timeout():
	can_attack = true

func target_in_range() -> bool:
	var distance = enemy.position.distance_to(enemy.target.position)
	return distance <= enemy.attack_range