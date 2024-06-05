extends Label

@export var enemy: Enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if enemy.target != null:
		text = enemy.target.name
	else:
		text = "None"
