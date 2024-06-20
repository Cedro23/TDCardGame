extends Node2D
class_name SpawnManager

@onready var spawnArea = $Area2D/CollisionShape2D.shape.extents
@onready var origin = $Area2D/CollisionShape2D.global_position -  spawnArea

@export var spawn_infos: Array[SpawnInfos] = []

signal enemy_counter_updated()
var enemies: Array[Enemy] = []

func get_enemies_left() -> int:
	return len(enemies)

func spawn_enemies() -> void:
	for infos in spawn_infos:
		var enemy = load(str(infos.enemy.resource_path))
		for _i in range(infos.enemy_quantity):
			var enemy_instance = enemy.instantiate()
			enemies.append(enemy_instance)
			enemy_instance.destroyed.connect(_on_enemy_destroyed.bind(enemy_instance))
			enemy_instance.global_position = _get_random_position()
			add_child(enemy_instance)
		enemy_counter_updated.emit()

func _get_random_position() -> Vector2:
	var x = randf_range(origin.x, spawnArea.x) / 2
	var y = randf_range(origin.y, spawnArea.y) / 2
	
	return Vector2(x, y)

func _on_enemy_destroyed(enemy_instance: Enemy):
	enemies.erase(enemy_instance)
	enemy_counter_updated.emit()

