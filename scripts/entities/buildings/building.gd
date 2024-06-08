extends Entity
class_name Building

signal destroyed()

# Called when the node enters the scene tree for the first time.
func _ready():
	_hp = _max_hp

func take_damage(damage: float):
	_hp -= damage
	print(name + " has " + str(_hp) + "hp left")
	if _hp <= 0:
		_die()

func _die():
	destroyed.emit()
	queue_free()