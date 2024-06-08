extends Entity
class_name Enemy

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

@export_group("Attack stats")
@export var attack_damage: float = 100.0
@export var attack_cooldown: float = 1.0
@onready var attack_timer: Timer = $AttackTimer
@onready var attack_range: Area2D = $AttackRange

@export_group("Movement stats")
@export var speed: float = 100.0
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var nav_timer: Timer = $NavigationTimer

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

	for b in buildings:
		var distance = position.distance_to(b.position)
		if closest_building == null or distance < shortest_distance:
			closest_building = b
			shortest_distance = distance

	return closest_building

func _on_target_destroyed():
	target.destroyed.disconnect(_on_target_destroyed)
	target = null

func target_in_range() -> bool:
	var overlapping_bodies = attack_range.get_overlapping_bodies()
	for body in overlapping_bodies:
		if body == target:
			return true
	return false
