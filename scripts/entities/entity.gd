extends CharacterBody2D
class_name Entity

signal destroyed()

@export_group("Defense stats")
@export var _max_hp: float = 100.0
var _hp:float 

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