extends Node
class_name EnemyStateMachine

@export var enemy: Entity
@export var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			# Connect to the state changed signal
			child.transitioned.connect(_on_state_changed)
			child.enemy = enemy
		else:
			push_warning('Child' + child.name + ' is not a State for CharacterStateMachine.')

func _input(event: InputEvent):
	current_state.handle_input(event)

func _physics_process(delta: float):
	current_state.process_physics(delta)

func _process(delta: float):
	current_state.process(delta)

func _on_state_changed(new_state_name: StringName):
	new_state_name = new_state_name.to_lower()
	if new_state_name == current_state.name:
		return
		
	var new_state = states[new_state_name]
	if !new_state:
		return
	
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter() 
	pass

func can_move() -> bool:
	return current_state.can_move
