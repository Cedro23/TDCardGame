extends CharacterBody2D
class_name Enemy

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

@export_group("Defense stats")
@export var _max_hp: float = 100.0
var _hp:float 

@export_group("Attack stats")
@export var attack_damage: float = 100.0
@export var attack_range: float = 100.0
@onready var attack_timer: Timer = $AttackTimer

@export_group("Movement stats")
@export var speed: float = 100.0

var target: Building = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_hp = _max_hp

func _process(_delta: float):
	pass

func take_damage(damage: float):
	_hp -= damage
	print(name + " has " + str(_hp) + "hp left")
	if _hp <= 0:
		_die()

func _die():
	queue_free()

func target_in_range() -> bool:
	var distance = position.distance_to(target.position)
	return distance <= attack_range