extends CharacterBody2D
class_name Enemy

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

@export_group("Defense stats")
@export var _max_hp: float = 100.0
var _hp:float 

@export_group("Attack stats")
@export var _attack_damage: float = 10.0
## Seconds to wait before attacking again
@export var _attack_cooldown: float = 1.0
@onready var _attack_timer: Timer = $AttackTimer

@export_group("Miscellaneous stats")
@export var _speed: float = 100.0


var _target: Building = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_hp = _max_hp
	_attack_timer.wait_time = _attack_cooldown

func attack():
	pass

