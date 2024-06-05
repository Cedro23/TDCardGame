extends Enemy
class_name BasicEnemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if _target != null && state_machine.can_move():
			var direction_to_target = (_target.position - global_position).normalized()
			velocity = direction_to_target * _speed
			move_and_slide()

func attack():
	_target.take_damage(_attack_damage)

func take_damage(damage: float):
	_hp -= damage
	print(name + " has " + str(_hp) + "hp left")
	if _hp <= 0:
		_die()

func _die():
	queue_free()