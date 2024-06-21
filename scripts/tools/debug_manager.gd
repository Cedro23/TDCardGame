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
