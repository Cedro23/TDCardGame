extends Control

@export var _spawn_manager: SpawnManager

@onready var _stopwatch: Label = $LblStopwatch
var _time_elapsed: float = 0.0

func _process(delta: float):
	if Input.is_action_just_pressed('debug_ui'):
		visible = !visible
	
	_update_stopwatch(delta)

func _update_stopwatch(delta: float):
	_time_elapsed += delta
	_stopwatch.text = str(_time_elapsed).pad_decimals(2)

func _on_btn_spawn_wave_pressed():
	_spawn_manager.spawn_enemies()

func _on_enemy_state_toggled(is_toggled: bool):
	for e in get_tree().get_nodes_in_group("Enemy"):
		e.get_node("Debug/StateDebug").visible = is_toggled

func _on_enemy_target_toggled(is_toggled: bool):
	for e in get_tree().get_nodes_in_group("Enemy"):
		e.get_node("Debug/TargetDebug").visible = is_toggled

func _on_tower_state_toggled(is_toggled: bool):
	for t in get_tree().get_nodes_in_group("Tower"):
		t.get_node("Debug/StateDebug").visible = is_toggled

func _on_tower_target_toggled(is_toggled: bool):
	for t in get_tree().get_nodes_in_group("Tower"):
		t.get_node("Debug/TargetDebug").visible = is_toggled

