extends Label

@export var entity: Entity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if entity.target != null:
		text = entity.target.name
	else:
		text = "None"
