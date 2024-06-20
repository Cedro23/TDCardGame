extends Node2D
class_name GameManager

@onready var spawn_manager = $SpawnManager
@onready var lbl_enemy_counter = $SpawnManager/CanvasLayer/LblEnemyCounter

func _ready():
	spawn_manager.enemy_counter_updated.connect(update_label)
	print('Game manager ready')
	

func update_label():
	lbl_enemy_counter.text = "Enemies left: " + str(spawn_manager.get_enemies_left())
