extends Entity
class_name Enemy

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

@export_group("Attack stats")
@export var attack_damage: float = 100.0
@export var attack_range: float = 100.0
@export var attack_cooldown: float = 1.0
@onready var attack_timer: Timer = $AttackTimer

@export_group("Movement stats")
@export var speed: float = 100.0

var target: Building = null

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_timer.wait_time = attack_cooldown
	_hp = _max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if target == null:
		target = get_target()
		if target != null:
			target.destroyed.connect(_on_target_destroyed)
	

func get_target():
	# TODO: Get buildings from player_manager
	var closest_building: Building = null
	var shortest_distance: float
	var buildings = get_tree().get_nodes_in_group("Building")

	print(len(buildings))

	# TODO: Change distance computation to make it work better
	for b in buildings:
		var distance = position.distance_to(b.position)
		if closest_building == null or distance < shortest_distance:
			closest_building = b
			shortest_distance = distance

	return closest_building

func _on_target_destroyed():
	target.destroyed.disconnect(_on_target_destroyed)
	target = null

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