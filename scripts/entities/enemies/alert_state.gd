extends State
class_name AlertState

func enter():
	pass

func process(_delta: float):
	if entity.target != null:
		transitioned.emit("aggro")
