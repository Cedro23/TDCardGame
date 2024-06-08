extends CharacterBody2D
class_name Entity

signal destroyed()
signal health_changed()

@export_group("Defense stats")
@export var _max_hp: float = 100.0
var _hp:float 


func _ready():
	_hp = _max_hp

func take_damage(damage: float):
	_hp -= damage
	health_changed.emit()
	if _hp <= 0:
		_die()

func _die():
	destroyed.emit()
	queue_free()