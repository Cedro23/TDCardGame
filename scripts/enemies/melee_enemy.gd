extends Enemy
class_name MeleeEnemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if _target != null && state_machine.can_move():
			var direction_to_target = (_target.position - global_position).normalized()
			move_and_collide(direction_to_target * _speed * delta)

func attack():
	_target.take_damage(_attack_damage)

func take_damage(damage: float):
	_hp -= damage
	print(name + " has " + str(_hp) + "hp left")
	if _hp <= 0:
		_die()

func _die():
	queue_free()