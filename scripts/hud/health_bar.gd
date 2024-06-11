extends TextureProgressBar
class_name HealthBar

@export var entity: Entity

func _ready():
	entity.health_changed.connect(_on_heatlh_changed)

func _on_heatlh_changed():
	value = (entity._hp/entity._max_hp) * 100
	if value == 100:
		visible = false
	else:
		visible = true
