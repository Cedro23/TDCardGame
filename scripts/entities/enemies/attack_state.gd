extends State
class_name AttackState

var can_attack: bool = false

func enter():
	entity.attack_timer.start()


func process_physics(_delta: float):
	if entity.target == null or not target_in_range():
		entity.attack_timer.stop()
		transitioned.emit("alert")
		
func process(_delta: float):
	if can_attack:
		attack()
		entity.attack_timer.start()

func attack():
	entity.target.take_damage(entity.attack_damage)
	can_attack = false

func _on_attack_timer_timeout():
	can_attack = true

func target_in_range() -> bool:
	var distance = entity.position.distance_to(entity.target.position)
	return distance <= entity.attack_range
