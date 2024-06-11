extends State
class_name AlertState

func enter():
	pass

func process(_delta: float):
	if entity.target == null:
		entity.target = entity.get_target()
		if entity.target != null:
			entity.target.destroyed.connect(entity._on_target_destroyed)
	if entity.target != null:
		if owner is Enemy:
			transitioned.emit("aggro")
		else:
			transitioned.emit("attack")
