extends Entity
class_name CombatEntity

var target: Entity = null

@export_group("Attack stats")
@export var attack_damage: float = 100.0
@export var attack_cooldown: float = 1.0
@onready var attack_timer: Timer = $AttackTimer
@onready var attack_range: Area2D = $AttackRange

func _ready():
	super()
	attack_timer.wait_time = attack_cooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass
	

func get_target():
	pass

func _on_target_destroyed():
	target.destroyed.disconnect(_on_target_destroyed)
	target = null

func target_in_range() -> bool:
	var overlapping_bodies = attack_range.get_overlapping_bodies()
	for body in overlapping_bodies:
		if body == target:
			return true
	return false
