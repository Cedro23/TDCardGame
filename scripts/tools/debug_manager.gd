extends Control

@export var spawn_manager: SpawnManager

func _process(_delta: float):
	if Input.is_action_just_pressed('debug_ui'):
		visible = !visible

func _on_btn_spawn_wave_pressed():
	spawn_manager.spawn_enemies()
