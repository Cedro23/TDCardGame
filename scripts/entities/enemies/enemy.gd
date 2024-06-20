extends CombatEntity
class_name Enemy

@onready var state_machine: StateMachine = $StateMachine

@export_group("Movement stats")
@export var speed: float = 100.0
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var nav_timer: Timer = $NavigationTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	_hp = _max_hp

func get_target():
	var closest_building: Entity = null
	var shortest_distance: float
	var buildings = get_tree().get_nodes_in_group("Building")

	for b in buildings:
		var distance = position.distance_to(b.position)
		if closest_building == null or distance < shortest_distance:
			closest_building = b
			shortest_distance = distance

	return closest_building
